<script setup>
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import { router } from "@inertiajs/vue3";
import { watch, ref, computed, onMounted, nextTick } from "vue";
import FormularioCliente from "../Clientes/FormularioCliente.vue";
import { useClientes } from "@/composables/clientes/useClientes";
import { useDate } from "@/composables/useDate.js";
import MiPaginacion from "@/Components/MiPaginacion.vue";
import ListaPorCliente from "../ClienteProductos/ListaPorCliente.vue";
import { ElPopover } from "element-plus";
import "element-plus/es/components/popover/style/css";

const props = defineProps({
    form: {
        type: Object,
    },
    sucursals: {
        type: Array,
        default: () => [],
    },
    categorias: {
        type: Array,
        default: () => [],
    },
    marcas: {
        type: Array,
        default: () => [],
    },
    tipo_ventas: {
        type: Array,
        default: () => [],
    },
    metodo_pagos: {
        type: Array,
        default: () => [],
    },
    tipo_productos: {
        type: Array,
        default: () => [],
    },
});

const enviando = ref(false);
const form = props.form;

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    if (form.id == 0) {
        return `<i class="fa fa-save"></i> Registrar Venta`;
    }
    return `<i class="fa fa-edit"></i> Actualizar Venta`;
});

const txtBtnCancelar = computed(() => {
    if (form.id == 0) {
        return `<i class="fa fa-times"></i> Cancelar Venta`;
    }
    return `<i class="fa fa-times"></i> Cancelar Actualización`;
});

const cancelarVenta = () => {
    const message =
        form.id == 0
            ? `Se cancelará la NUEVA VENTA`
            : `Se cancelará la ACTUALIZACIÓN DE LA VENTA ${form.codigo_venta}`;

    Swal.fire({
        // icon: "question",
        title: "¿Cancelar regitro?",
        html: `${message}`,
        showCancelButton: true,
        confirmButtonText: "Si, Cancelar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
        customClass: {
            confirmButton: "btn-danger",
        },
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            if (form.id != 0) {
                router.get(route("ventas.index"));
            } else {
                form.reset();
                cargarProductos();
            }
        }
    });
};

const enviarFormulario = () => {
    enviando.value = true;
    form.sucursal_id = sucursal_id.value;
    let url =
        form.id == 0 ? route("ventas.store") : route("ventas.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: (response) => {
            console.log("correcto");
            const success =
                response.props.flash.success ?? "Proceso realizado con éxito";
            const url_blank = response.props.url_blank ?? null;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>${success}</strong>`,
                confirmButtonText: `Aceptar`,
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });

            if (url_blank) {
                window.open(url_blank, "_blank");
            }

            cargarProductos();
            emits("envio-formulario");
        },
        onError: (err, code) => {
            console.log(code ?? "");
            if (Object.keys(form.errors).length > 0) {
                const errores = Object.values(form.errors)
                    .map((error) => `<li>${error}</li>`)
                    .join("");

                Swal.fire({
                    icon: "error",
                    title: "Errores de validación",
                    html: `
                <p>Existen errores en el formulario:</p>
                <ul style="text-align:left;">
                    ${errores}
                </ul>
            `,
                    confirmButtonText: "Aceptar",
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "Ocurrió un error inesperado, contacte con el administrador.",
                    confirmButtonText: "Aceptar",
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            }
        },
        onFinish: () => {
            enviando.value = false;
        },
    });
};

const emits = defineEmits(["envio-formulario"]);

const tipo_venta_id_default = ref("");
const listProductoSucursals = ref([]);
const loadingLista = ref(true);
const sucursal_id = ref("");
const categoria_id = ref("todos");
const marca_id = ref("todos");
const nombreProducto = ref("");
const currentPage = ref(1);
const perPage = ref(24);
const total_registros = ref(0);
const cambioDePagina = async (value) => {
    loadingLista.value = true;
    currentPage.value = value;
    cargarProductos();
};
const cargarProductos = async () => {
    loadingLista.value = true;
    try {
        const res = await axios.get(route("producto_sucursals.paginado"), {
            params: {
                perPage: perPage.value,
                page: currentPage.value,
                sucursal_id: sucursal_id.value,
                categoria_id: categoria_id.value,
                marca_id: marca_id.value,
                nombreProducto: nombreProducto.value,
                activo: 1,
            },
        });
        listProductoSucursals.value = res.data.data.map((item) => ({
            ...item,
            cantidad: 1,
            precio_venta: item.precio,
            stock_aux: item.stock_total,
            tipo_venta_id: tipo_venta_id_default.value,
        }));

        if (form.id != 0 && sucursal_id.value != form.sucursal_id) {
            const ids = form.venta_detalles
                .filter((detalle) => detalle.id)
                .map((detalle) => detalle.id);

            form.eliminados = [...form.eliminados, ...ids];

            form.venta_detalles = [];
        }
        total_registros.value = res.data.total;
    } catch (e) {
        console.log(e);
    } finally {
        loadingLista.value = false;
    }
};

const detectarCambioSelect = () => {
    currentPage.value = 1;
    cargarProductos();
};

const intervalNombre = ref(null);
const filtrarNombres = () => {
    clearInterval(intervalNombre.value);
    intervalNombre.value = setTimeout(() => {
        cargarProductos();
    }, 370);
};

const cargarListas = () => {};

const listClientes = ref([]);
const cargandoClientes = ref(false);

let temporizadorClientes = null;
let ultimaBusqueda = 0;

const buscarClientes = (texto) => {
    clearTimeout(temporizadorClientes);

    const busqueda = texto?.trim() ?? "";
    const peticion = ++ultimaBusqueda;

    if (busqueda.length < 2) {
        listClientes.value = [];
        cargandoClientes.value = false;
        return;
    }

    temporizadorClientes = setTimeout(async () => {
        cargandoClientes.value = true;

        try {
            const response = await axios.get("/admin/clientes/buscar", {
                params: { q: busqueda },
            });

            // Ignorar respuestas de búsquedas anteriores.
            if (peticion === ultimaBusqueda) {
                listClientes.value = response.data;
            }
        } catch (error) {
            if (peticion === ultimaBusqueda) {
                listClientes.value = [];
                console.error("Error al buscar clientes:", error);
            }
        } finally {
            if (peticion === ultimaBusqueda) {
                cargandoClientes.value = false;
            }
        }
    }, 300);
};

const obtenerPrecioClienteProducto = (producto_id) => {
    const cliente_producto = listClienteProductos.value.filter(
        (item) => item.producto_id == producto_id,
    )[0];
    if (cliente_producto) {
        return Number(parseFloat(cliente_producto.precio));
    }
    return -1;
};

const reasignarPreciosPorClienteProductos = () => {
    const porcentaje = form.porcentaje_descuento;
    form.venta_detalles.map((elem) => {
        let cliente_producto_precio = obtenerPrecioClienteProducto(
            elem.producto_id,
        );
        if (cliente_producto_precio > -1) {
            elem.precio = cliente_producto_precio;
        }

        const con_descuento = elem.precio - elem.descuento_uni;
        elem.porcen_dt = porcentaje;
        elem.descuento_total = con_descuento * (porcentaje / 100);
        elem.total_uni = elem.cantidad * con_descuento;
        elem.total_uni = parseFloat(elem.total_uni).toFixed(2);

        // TOTAL PARA CALCULAR GANANCIA BRUTA
        elem.precio_final = con_descuento - elem.descuento_total;
        elem.total = elem.cantidad * elem.precio_final;
    });
    toast.success("Precios reasignados por cliente", {
        autoClose: 220,
    });
};

const agregandoProducto = ref(false);
const agregarProductoVenta = async (item) => {
    agregandoProducto.value = true;
    const stock_total = Number(item.stock_total);
    let precio = Number(item.precio_venta);
    let cliente_producto_precio = obtenerPrecioClienteProducto(item.id);
    if (cliente_producto_precio > -1) {
        precio = cliente_producto_precio;
    }
    const cantidad = Number(item.cantidad);

    if (item.tipo == "PRODUCTO" && (!stock_total || stock_total < cantidad)) {
        toast.error("Stock insuficiente para agregar el producto");
        agregandoProducto.value = false;
        return;
    }
    if (!precio || precio <= 0) {
        toast.error("Debe ingresar un precio valido");
        agregandoProducto.value = false;
        return;
    }

    if (!cantidad || cantidad <= 0) {
        toast.error("Debe ingresar una cantidad valido");
        agregandoProducto.value = false;
        return;
    }

    try {
        let resp = null;
        let producto = null;
        let venta_lotes = [];
        if (item.tipo != "PRODUCTO") {
            resp = await axios.get(route("productos.show", item.id));
            producto = resp.data;
        } else {
            resp = await axios.get(
                route("producto_sucursals.getCantidadLotesProducto"),
                {
                    params: {
                        sucursal_id: form.sucursal_id,
                        producto_id: item.id,
                        cantidad: cantidad,
                    },
                },
            );
            producto = resp.data.producto;
            venta_lotes = resp.data.venta_lotes;
        }
        const subtotal = cantidad * precio;
        const indexExiste = form.venta_detalles.findIndex(
            (elem) => elem.producto_id == producto.id,
        );
        // console.log(indexExiste);
        if (indexExiste < 0) {
            // no existe

            // buscar promociones
            const detalle_promocions = await obtenerPromocionesProducto(
                item.id,
                cantidad,
            );
            const inscripcions = await verificaInscripcionesPlan(
                item,
                cantidad,
            );

            form.venta_detalles.push({
                id: 0,
                venta_id: "",
                producto: producto,
                producto_id: producto.id,
                cantidad: cantidad,
                venta_lotes: venta_lotes,
                precio: precio,
                descuento_uni: 0,
                porcen_du: 0,
                descuento_promocion: 0,
                porcen_promocion: 0,
                tm_descuento_uni: 0,
                tp_descuento_uni: 0,
                descuento_total: 0,
                porcen_dt: 0,
                precio_final: precio,
                total_sd: subtotal.toFixed(2),
                total: subtotal.toFixed(2),
                total_uni: subtotal.toFixed(2),
                detalle_promocions: detalle_promocions,
                inscripcions: inscripcions,
            });
            calcularDescuentosYTotalesFila(form.venta_detalles.length - 1);
        } else {
            // existe
            const cantidadFila = form.venta_detalles[indexExiste].cantidad;
            const nuevaCantidad =
                parseFloat(cantidad) + parseFloat(cantidadFila);
            // buscar promociones
            const detalle_promocions = await obtenerPromocionesProducto(
                item.id,
                nuevaCantidad,
            );
            const inscripcions = await verificaInscripcionesPlan(
                item,
                nuevaCantidad,
            );

            form.venta_detalles[indexExiste].cantidad = nuevaCantidad;

            form.venta_detalles[indexExiste].detalle_promocions =
                detalle_promocions;
            form.venta_detalles[indexExiste].inscripcions = inscripcions;

            calcularDescuentosYTotalesFila(indexExiste);
        }
        // console.log(item);
        item.cantidad = 1;
        toast.success("Producto Agregado!!!", {
            autoClose: 250,
        });
        item.stock_total = stock_total - cantidad;
    } catch (e) {
        console.log(e);
        toast.error(
            "Ocurrió un error al intentar agregar el producto; intente nuevamente",
        );
    } finally {
        agregandoProducto.value = false;
    }
};

const verificaInscripcionesPlan = (producto, cantidad) => {
    let inscripciones = [];
    if (producto.tipo == "PLAN") {
        for (let i = 1; i <= cantidad; i++) {
            inscripciones.push({
                id: 0,
                sucursal_id: "",
                user_cliente_id: "",
                cliente_id: "",
                producto_id: producto.id,
                venta_detalle_id: "",
                declaracion_jurada: "",
                fecha_inicio: useDate().getFechaActual(),
                estado: "",
                fecha_pausa: "",
                dias_pausa: "",
                justificacion_pausa: "",
                dias_restantes: "",
                fecha_fin: "",
            });
        }
    }

    return inscripciones;
};

const obtenerPromocionesProducto = async (producto_id, cantidad) => {
    try {
        const resp_promocion = await axios.get(
            route("promocions.getPromocionProducto"),
            {
                params: {
                    producto_id: producto_id,
                    cantidad: cantidad,
                },
            },
        );
        // console.log("promociones");
        // console.log(resp_promocion.data);
        return resp_promocion.data;
    } catch (e) {
        console.log(e);
        toast.error(
            "Ocurrió un error al intentar obtener promociones del producto. Intente mas tarde",
        );
    }
};

const calcularDescuentosYTotalesFila = (index) => {
    const producto = form.venta_detalles[index].producto;
    if (!producto) {
        toast.error(
            "Ocurrió un error al intentar calcular los datos. Intente nuevamente por favor",
            {
                autoClose: 200,
            },
        );
    }

    const cant = parseFloat(form.venta_detalles[index].cantidad);
    const precio = parseFloat(form.venta_detalles[index].precio);
    const descuento_uni = parseFloat(form.venta_detalles[index].descuento_uni);
    const descuento_total = parseFloat(
        form.venta_detalles[index].descuento_total,
    );
    let precio_final = precio - descuento_uni;
    const porcen_du = parseFloat(100 - (precio_final * 100) / precio).toFixed(
        2,
    );

    let total_sd = cant * precio;
    let total_uni = cant * precio_final;
    let total =
        cant *
        (precio - (parseFloat(descuento_uni) + parseFloat(descuento_total)));

    let total_descuento_promocion = 0;
    let porcen_promocion = 0;
    if (form.venta_detalles[index].detalle_promocions.length > 0) {
        form.venta_detalles[index].detalle_promocions.forEach((elem) => {
            if (elem.porcentaje_monto == "PORCENTAJE") {
                total_descuento_promocion += Math.round(
                    (elem.porcentaje * precio) / 100,
                    2,
                );
            } else {
                total_descuento_promocion += parseFloat(elem.monto);
            }
        });

        precio_final = precio - descuento_uni - total_descuento_promocion;
        const precio_cp = precio - total_descuento_promocion;
        porcen_promocion = parseFloat(100 - (precio_cp * 100) / precio).toFixed(
            2,
        );

        total_uni = cant * precio_final;
        total =
            cant *
            (precio -
                (parseFloat(descuento_uni) +
                    parseFloat(descuento_total) +
                    parseFloat(total_descuento_promocion)));
    }
    form.venta_detalles[index].porcen_du = porcen_du;
    form.venta_detalles[index].descuento_promocion = total_descuento_promocion;
    form.venta_detalles[index].porcen_promocion = porcen_promocion;
    form.venta_detalles[index].tm_descuento_uni =
        total_descuento_promocion + descuento_uni;
    form.venta_detalles[index].tp_descuento_uni = porcen_promocion + porcen_du;
    form.venta_detalles[index].precio_final = precio_final;
    form.venta_detalles[index].descuento_uni = descuento_uni;
    form.venta_detalles[index].total_sd = total_sd;
    form.venta_detalles[index].total_uni = total_uni;
    form.venta_detalles[index].total = total;
};

const aplicarDescuentosTotal = () => {
    const descuento = Number(form.descuento ?? 0);
    form.venta_detalles.map((elem) => {
        elem.descuento_total = 0;
        elem.porcen_dt = 0;
    });
    if (descuento > 0) {
        let porcentaje = (form.total * 100) / form.subtotal;
        porcentaje = 100 - porcentaje;
        porcentaje = porcentaje.toFixed(2);
        porcentaje = parseFloat(porcentaje);
        form.porcentaje_descuento = porcentaje;
        form.venta_detalles.map((elem) => {
            const precio_final = elem.precio_final;
            elem.porcen_dt = porcentaje;
            elem.descuento_total = elem.precio * (porcentaje / 100);
            elem.total = elem.cantidad * (precio_final - elem.descuento_total);
            elem.total = parseFloat(elem.total).toFixed(2);

            // TOTAL PARA CALCULAR GANANCIA BRUTA
            console.log(elem.precio_final);
            console.log(elem.descuento_total);
        });
    }
};

const detectarCambioFila = async (item, index) => {
    const cant = Number(item.cantidad);
    const precio = Number(item.precio);
    const descuento_uni = Number(item.descuento_uni ?? 0);
    const descuento_total = Number(item.descuento_total ?? 0);
    if (!cant || !precio) {
        return;
    }

    // inscripciones
    form.venta_detalles[index].inscripcions = await verificaInscripcionesPlan(
        item.producto,
        cant,
    );

    // promociones
    form.venta_detalles[index].detalle_promocions =
        await obtenerPromocionesProducto(item.producto_id, cant);

    // descuentos
    calcularDescuentosYTotalesFila(index);

    // stock
    recalcularStockActualCambioDetalle(item.producto_id, cant, index);
};

const quitarFila = (item, index) => {
    const id = item.id;
    if (id != 0) {
        form.eliminados.push(id);
    }

    if (item.producto.tipo == "PRODUCTO")
        sumarDetalleEliminado(
            item.producto_id,
            Number(form.venta_detalles[index].cantidad),
        );
    form.venta_detalles.splice(index, 1);
    toast.success("Se quitó el producto!!!", {
        autoClose: 250,
    });
};

const sumarDetalleEliminado = (producto_id, cantidad) => {
    const item_sucursal_origen = listProductoSucursals.value.find(
        (elem) => elem.id == producto_id,
    );
    item_sucursal_origen.stock_total =
        Number(item_sucursal_origen.stock_total) + Number(cantidad);
};

const recalcularStockActualCambioDetalle = (
    producto_id,
    cantidad,
    index = null,
) => {
    const item_sucursal_origen = listProductoSucursals.value.find(
        (elem) => elem.id == producto_id,
    );
    // console.log("itemsucursal origen");
    // console.log(item_sucursal_origen);
    if (!item_sucursal_origen) return;
    if (index !== null) {
        if (
            item_sucursal_origen.tipo == "PRODUCTO" &&
            cantidad > item_sucursal_origen.stock_aux
        ) {
            toast.error("Stock insuficiente para la cantidad ingresada");
            form.venta_detalles[index].cantidad =
                item_sucursal_origen.stock_aux;
            return;
        }
    }

    item_sucursal_origen.stock_total =
        Number(item_sucursal_origen.stock_aux) - Number(cantidad);
};

const subTotalVenta = computed(() => {
    if (!form?.venta_detalles) return 0;
    return form.venta_detalles.reduce((acc, item) => {
        return acc + parseFloat(item.total_uni || 0);
    }, 0);
});

const totalVenta = computed(() => {
    if (!form?.venta_detalles) return 0;
    const subtotal = form.venta_detalles.reduce((acc, item) => {
        return acc + parseFloat(item.total_uni || 0);
    }, 0);

    const descuento = parseFloat(form.descuento) || 0;
    return subtotal - descuento;
});
const saldoVenta = computed(() => {
    const cancelado =
        (parseFloat(form.cancelado_efectivo) || 0) +
        (parseFloat(form.cancelado_qr) || 0);
    return (parseFloat(form.total) || 0) - cancelado;
});

watch([subTotalVenta, totalVenta, saldoVenta], () => {
    form.metodo_pago = "";
    if (form.cancelado > 0) {
        form.metodo_pago = "EFECTIVO";
    }
    form.subtotal = subTotalVenta.value.toFixed(2);
    form.total = totalVenta.value.toFixed(2);
    form.saldo = saldoVenta.value.toFixed(2);
});

const cambiarTipoVenta = () => {
    form.total_cancelado = form.total;
    if (form.tipo_venta == "CRÉDITO") {
        form.total_cancelado = 0;
    }
};

// CLIENTE
const muestra_form_cliente = ref(false);
const { setCliente, limpiarCliente, form: formCliente } = useClientes();
const cerrarFormCliente = () => {
    limpiarCliente();
    muestra_form_cliente.value = false;
};

const actualizarClientes = (cliente) => {
    listClientes.value.push(cliente);
    form.cliente_id = cliente.id;
    muestra_form_cliente.value = false;
    limpiarCliente();
};

const nuevoCliente = () => {
    limpiarCliente();
    muestra_form_cliente.value = true;
};

const listClienteProductos = ref([]);
const muestra_cliente_productos = ref(false);
const buscarClienteProductos = () => {
    listClienteProductos.value = [];
    if (form.cliente_id) {
        axios
            .get(route("cliente_productos.listado"), {
                params: {
                    cliente_id: form.cliente_id,
                },
            })
            .then((response) => {
                listClienteProductos.value = response.data.cliente_productos;
                if (listClienteProductos.value.length > 0)
                    reasignarPreciosPorClienteProductos();
            });
    }
};

onMounted(() => {
    cargarListas();
    // edit
    if (form.id != 0) {
        sucursal_id.value = form.sucursal_id;
        cargarProductos();
        buscarClientes(form.cliente.nombre);
    }
});
</script>

<template>
    <form @submit.prevent="enviarFormulario()">
        <FormularioCliente
            v-if="muestra_form_cliente"
            :form="formCliente"
            :muestra_formulario="muestra_form_cliente"
            @envio-formulario="actualizarClientes"
            @cerrar-formulario="cerrarFormCliente"
        />

        <div class="container-fluid py-3 bg-light">
            <div class="row g-3">
                <!-- CATALOGO -->
                <div class="col-12 col-md-7">
                    <div class="card h-100 border-0 shadow-sm">
                        <div
                            class="card-header text-white border-0 px-3 py-3"
                            style="
                                background: linear-gradient(
                                    135deg,
                                    var(--bg1),
                                    var(--bg2)
                                );
                            "
                        >
                            <div class="row g-3 align-items-end">
                                <div class="col-12 col-md-5">
                                    <div
                                        class="d-flex align-items-center gap-2"
                                    >
                                        <div
                                            class="d-flex align-items-center justify-content-center rounded-3 flex-shrink-0 bg-white text-primary"
                                            style="width: 42px; height: 42px"
                                        >
                                            <i class="fas fa-store"></i>
                                        </div>
                                        <div>
                                            <div class="fw-semibold text-white">
                                                Nueva venta
                                            </div>
                                            <small class="text-white-50"
                                                >Selecciona los productos para
                                                agregar</small
                                            >
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-7">
                                    <label
                                        class="form-label small fw-semibold text-white mb-1"
                                        >Sucursal</label
                                    >
                                    <div class="input-group">
                                        <span class="input-group-text bg-white"
                                            ><i
                                                class="fas fa-building text-primary"
                                            ></i
                                        ></span>
                                        <div class="form-control p-0 border-0">
                                            <el-select
                                                v-model="sucursal_id"
                                                class="w-100"
                                                no-data-text="Sin datos"
                                                no-match-text="Sin resultados"
                                                placeholder="Seleccionar sucursal"
                                                filterable
                                                @change="detectarCambioSelect"
                                            >
                                                <el-option
                                                    v-for="item in sucursals"
                                                    :key="item.id"
                                                    :value="item.id"
                                                    :label="item.nombre"
                                                />
                                            </el-select>
                                        </div>
                                    </div>
                                    <ul
                                        v-if="form.errors?.sucursal_id"
                                        class="text-warning list-unstyled mt-1 mb-0"
                                    >
                                        <li class="small">
                                            {{ form.errors.sucursal_id }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div
                            v-if="sucursal_id"
                            class="card-body bg-light border-bottom py-2 px-3 catalog-search-body"
                        >
                            <div
                                class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-1"
                            >
                                <div>
                                    <div class="fw-bold text-dark">
                                        <i class="fas fa-box-open me-2"></i
                                        >Productos
                                    </div>
                                    <small class="text-muted"
                                        >Busca por código o nombre</small
                                    >
                                </div>
                                <button
                                    type="button"
                                    class="btn btn-outline-secondary btn-sm"
                                    @click.prevent="cargarProductos"
                                >
                                    <i class="fas fa-sync me-1"></i>Actualizar
                                </button>
                            </div>

                            <div class="input-group">
                                <span class="input-group-text bg-white"
                                    ><i class="fas fa-search"></i
                                ></span>
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="nombreProducto"
                                    placeholder="Código o nombre del producto"
                                    @keyup="filtrarNombres"
                                />
                                <button
                                    v-if="nombreProducto"
                                    type="button"
                                    class="btn btn-outline-secondary"
                                    title="Limpiar búsqueda"
                                    @click.prevent="
                                        nombreProducto = '';
                                        cargarProductos();
                                    "
                                >
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>

                        <div
                            v-else
                            class="px-3 py-1 bg-light border-bottom catalog-search-empty"
                        >
                            <small class="text-muted">
                                <i class="fas fa-info-circle me-1"></i>
                                Selecciona una sucursal para buscar productos.
                            </small>
                        </div>

                        <div class="card-body p-0">
                            <div
                                v-if="!sucursal_id"
                                class="text-center text-muted py-5 px-3"
                            >
                                <i
                                    class="fas fa-building fa-2x mb-3 text-secondary"
                                ></i>
                                <div class="fw-bold">
                                    Selecciona una sucursal
                                </div>
                                <small
                                    >Primero selecciona una sucursal para ver
                                    sus productos.</small
                                >
                            </div>

                            <div
                                v-else-if="loadingLista"
                                class="text-center text-muted py-5 px-3"
                            >
                                <i
                                    class="fas fa-spinner fa-spin fa-2x mb-3 text-primary"
                                ></i>
                                <div>Cargando productos...</div>
                            </div>

                            <div
                                v-else-if="
                                    !listProductoSucursals ||
                                    listProductoSucursals.length === 0
                                "
                                class="text-center text-muted py-5 px-3"
                            >
                                <i
                                    class="fas fa-box-open fa-2x mb-3 text-secondary"
                                ></i>
                                <div class="fw-bold">
                                    No hay productos disponibles
                                </div>
                                <small
                                    >Intenta actualizar o cambiar la
                                    búsqueda.</small
                                >
                            </div>

                            <div v-else class="list-group list-group-flush">
                                <div
                                    v-for="item in listProductoSucursals"
                                    :key="item.id"
                                    class="list-group-item px-3 py-3 product-row"
                                    :class="{
                                        'catalog-stock-insufficient':
                                            item.tipo == 'PRODUCTO' &&
                                            Number(item.stock_total || 0) <
                                                Number(item.cantidad || 1),
                                    }"
                                >
                                    <div class="row g-2 align-items-center">
                                        <div class="col-12 col-lg">
                                            <div
                                                class="fw-bold text-dark text-truncate"
                                                :title="item.nombre"
                                            >
                                                {{ item.nombre }}
                                            </div>
                                            <div
                                                class="d-flex flex-wrap gap-3 mt-1 text-muted small"
                                            >
                                                <span
                                                    ><i
                                                        class="fas fa-barcode me-1"
                                                    ></i
                                                    >{{ item.codigo }}</span
                                                >
                                                <span
                                                    ><i
                                                        class="fas fa-cubes me-1"
                                                    ></i
                                                    >Stock:
                                                    <strong
                                                        v-if="
                                                            item.tipo ==
                                                            'PRODUCTO'
                                                        "
                                                        :class="{
                                                            'text-danger':
                                                                item.stock_total <
                                                                item.stock_min,
                                                            'text-warning':
                                                                item.stock_total ==
                                                                item.stock_min,
                                                            'text-success':
                                                                item.stock_total >
                                                                item.stock_min,
                                                        }"
                                                        >{{
                                                            item.stock_total
                                                        }}</strong
                                                    >
                                                    <strong
                                                        v-else
                                                        class="text-success"
                                                        >1</strong
                                                    >
                                                </span>
                                                <span
                                                    v-if="
                                                        item.tipo ==
                                                            'PRODUCTO' &&
                                                        Number(
                                                            item.stock_total ||
                                                                0,
                                                        ) <
                                                            Number(
                                                                item.cantidad ||
                                                                    1,
                                                            )
                                                    "
                                                    class="stock-warning"
                                                >
                                                    <i
                                                        class="fas fa-exclamation-triangle me-1"
                                                    ></i>
                                                    Stock insuficiente
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-6 col-sm-4 col-lg-auto">
                                            <div class="text-muted small">
                                                Precio
                                            </div>
                                            <strong
                                                >Bs. {{ item.precio }}</strong
                                            >
                                        </div>
                                        <div class="col-6 col-sm-4 col-lg-auto">
                                            <label
                                                class="form-label text-muted small mb-1"
                                                >Cant.</label
                                            >
                                            <input
                                                type="number"
                                                class="form-control form-control-sm text-center catalog-quantity"
                                                v-model="item.cantidad"
                                                min="1"
                                            />
                                        </div>
                                        <div
                                            class="col-12 col-sm-4 col-lg-auto d-flex align-items-end justify-content-lg-end"
                                        >
                                            <button
                                                type="button"
                                                class="btn btn-primary btn-sm catalog-add-button"
                                                title="Agregar producto"
                                                :disabled="agregandoProducto"
                                                @click.prevent="
                                                    agregarProductoVenta(item)
                                                "
                                            >
                                                <i class="fas fa-plus"></i>
                                                <span class="catalog-add-label"
                                                    >Agregar</span
                                                >
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div
                            v-if="sucursal_id"
                            class="card-footer bg-white d-flex flex-wrap justify-content-between align-items-center gap-2"
                        >
                            <small class="text-muted"
                                >Total registros: {{ total_registros }}</small
                            >
                            <MiPaginacion
                                :pagination-class="'mb-0'"
                                :total-data="total_registros"
                                :current-page="currentPage"
                                :per-page="perPage"
                                @updatePage="cambioDePagina"
                            />
                        </div>
                    </div>
                </div>

                <!-- RESUMEN -->
                <div class="col-12 col-md-5">
                    <div class="card border-0 shadow-sm">
                        <div
                            class="card-header text-white border-0 px-3 py-3"
                            style="
                                background: linear-gradient(
                                    135deg,
                                    var(--bgSuccess),
                                    var(--bg2)
                                );
                            "
                        >
                            <div
                                class="d-flex align-items-center justify-content-between gap-2"
                            >
                                <div
                                    class="d-flex align-items-center gap-2 min-width-0"
                                >
                                    <div
                                        class="d-flex align-items-center justify-content-center rounded-3 flex-shrink-0 bg-white text-success"
                                        style="width: 42px; height: 42px"
                                    >
                                        <i class="fas fa-shopping-cart"></i>
                                    </div>
                                    <div class="min-width-0">
                                        <h5
                                            class="mb-1 fw-semibold text-white text-truncate"
                                        >
                                            Resumen de venta
                                        </h5>
                                        <small
                                            class="text-white-50 d-block text-truncate"
                                        >
                                            <span v-if="form.id != 0"
                                                >Código:
                                                {{ form.codigo_venta }}</span
                                            >
                                            <span v-else>Nueva venta</span>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-body border-bottom pb-2">
                            <div class="section-heading section-heading-info">
                                <div class="d-flex align-items-center gap-2">
                                    <span class="section-heading-icon"
                                        ><i class="fas fa-info-circle"></i
                                    ></span>
                                    <div>
                                        <strong class="d-block"
                                            >Datos básicos</strong
                                        >
                                        <small
                                            >Información general de la
                                            venta</small
                                        >
                                    </div>
                                </div>
                            </div>

                            <div class="row g-2">
                                <div class="col-6">
                                    <label class="form-label small fw-bold"
                                        >Fecha</label
                                    >
                                    <input
                                        type="date"
                                        class="form-control form-control-sm"
                                        v-model="form.fecha"
                                    />
                                </div>
                                <div class="col-6">
                                    <label class="form-label small fw-bold"
                                        >Hora</label
                                    >
                                    <input
                                        type="time"
                                        class="form-control form-control-sm"
                                        v-model="form.hora"
                                    />
                                </div>
                            </div>
                            <div class="mt-1">
                                <label class="form-label small fw-bold"
                                    >Cliente</label
                                >
                                <div class="input-group">
                                    <div class="form-control p-0 border-0">
                                        <el-select
                                            v-model="form.cliente_id"
                                            class="w-100"
                                            size="large"
                                            no-data-text="Sin datos"
                                            no-match-text="Sin resultados"
                                            loading-text="Buscando..."
                                            placeholder="Sin Nombre"
                                            filterable
                                            remote
                                            clearable
                                            :remote-method="buscarClientes"
                                            :loading="cargandoClientes"
                                            :reserve-keyword="true"
                                        >
                                            <el-option
                                                v-for="item in listClientes"
                                                :key="item.id"
                                                :value="item.id"
                                                :label="`${item.full_name} - ${item.full_ci}`"
                                            />
                                        </el-select>
                                    </div>
                                    <button
                                        type="button"
                                        class="btn btn-primary"
                                        title="Nuevo cliente"
                                        @click.prevent="nuevoCliente"
                                    >
                                        <i class="fas fa-user-plus"></i>
                                    </button>
                                </div>
                                <ul
                                    v-if="form.errors?.cliente_id"
                                    class="text-danger list-unstyled mb-0 mt-1"
                                >
                                    <li class="small">
                                        {{ form.errors.cliente_id }}
                                    </li>
                                </ul>
                            </div>

                            <!-- <div
                                v-if="listClienteProductos.length > 0"
                                class="alert alert-primary d-flex align-items-center justify-content-between gap-2 mt-3 mb-0 py-2"
                            >
                                <div class="d-flex align-items-center gap-2">
                                    <i class="fas fa-boxes"></i>
                                    <div>
                                        <strong class="d-block small"
                                            >Productos asignados</strong
                                        >
                                        <small
                                            >{{
                                                listClienteProductos.length
                                            }}
                                            productos</small
                                        >
                                    </div>
                                </div>
                                <div class="d-flex gap-1">
                                    <button
                                        type="button"
                                        class="btn btn-sm btn-light"
                                        title="Ver productos"
                                        @click.prevent="
                                            muestra_cliente_productos = true
                                        "
                                    >
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button
                                        type="button"
                                        class="btn btn-sm btn-light"
                                        title="Asignar precios"
                                        @click.prevent="
                                            reasignarPreciosPorClienteProductos
                                        "
                                    >
                                        <i class="fas fa-sync"></i>
                                    </button>
                                </div>
                                <ListaPorCliente
                                    v-if="muestra_cliente_productos"
                                    :muestra_formulario="
                                        muestra_cliente_productos
                                    "
                                    :cliente_productos="listClienteProductos"
                                    @cerrar-formulario="
                                        muestra_cliente_productos = false
                                    "
                                />
                            </div> -->
                        </div>

                        <!-- CONCEPTOS AGREGADOS -->
                        <div class="card-body p-0">
                            <div
                                class="section-heading section-heading-primary"
                            >
                                <div class="d-flex align-items-center gap-2">
                                    <span class="section-heading-icon"
                                        ><i class="fas fa-shopping-basket"></i
                                    ></span>
                                    <div>
                                        <strong class="d-block"
                                            >Conceptos agregados</strong
                                        ><small
                                            >Productos, servicios y
                                            planes</small
                                        >
                                    </div>
                                </div>
                                <span class="badge section-heading-badge">{{
                                    form.venta_detalles.length
                                }}</span>
                            </div>

                            <div
                                v-if="form.venta_detalles.length > 0"
                                class="concept-list"
                            >
                                <div
                                    v-for="(item, index) in form.venta_detalles"
                                    :key="index"
                                    class="list-group-item px-3 py-3 concept-row"
                                    :class="{
                                        'concept-row-product':
                                            item.producto.tipo === 'PRODUCTO',
                                        'concept-row-service':
                                            item.producto.tipo === 'SERVICIO',
                                        'concept-row-plan':
                                            item.producto.tipo === 'PLAN',
                                    }"
                                >
                                    <div class="row g-2 align-items-center">
                                        <div class="col-12 col-lg">
                                            <div
                                                class="d-flex align-items-center gap-2 min-width-0"
                                            >
                                                <span
                                                    class="concept-icon d-flex align-items-center justify-content-center rounded-circle flex-shrink-0"
                                                    :class="{
                                                        'concept-icon-product':
                                                            item.producto
                                                                .tipo ===
                                                            'PRODUCTO',
                                                        'concept-icon-service':
                                                            item.producto
                                                                .tipo ===
                                                            'SERVICIO',
                                                        'concept-icon-plan':
                                                            item.producto
                                                                .tipo ===
                                                            'PLAN',
                                                    }"
                                                >
                                                    <i
                                                        :class="{
                                                            'fas fa-box':
                                                                item.producto
                                                                    .tipo ===
                                                                'PRODUCTO',
                                                            'fas fa-concierge-bell':
                                                                item.producto
                                                                    .tipo ===
                                                                'SERVICIO',
                                                            'fas fa-id-card':
                                                                item.producto
                                                                    .tipo ===
                                                                'PLAN',
                                                        }"
                                                    ></i>
                                                </span>
                                                <div class="min-width-0">
                                                    <div
                                                        class="d-flex flex-wrap align-items-center gap-2"
                                                    >
                                                        <strong
                                                            class="text-dark text-truncate"
                                                            :title="
                                                                item.producto
                                                                    .nombre
                                                            "
                                                            >{{
                                                                item.producto
                                                                    .nombre
                                                            }}</strong
                                                        >
                                                        <span
                                                            class="badge rounded-pill concept-badge"
                                                            :class="{
                                                                'concept-badge-product':
                                                                    item
                                                                        .producto
                                                                        .tipo ===
                                                                    'PRODUCTO',
                                                                'concept-badge-service':
                                                                    item
                                                                        .producto
                                                                        .tipo ===
                                                                    'SERVICIO',
                                                                'concept-badge-plan':
                                                                    item
                                                                        .producto
                                                                        .tipo ===
                                                                    'PLAN',
                                                            }"
                                                            >{{
                                                                item.producto
                                                                    .tipo ||
                                                                "PRODUCTO"
                                                            }}</span
                                                        >
                                                    </div>
                                                    <div
                                                        class="d-flex flex-wrap gap-3 mt-1 text-muted small"
                                                    >
                                                        <span
                                                            ><i
                                                                class="fas fa-barcode me-1"
                                                            ></i
                                                            >{{
                                                                item.producto
                                                                    .codigo
                                                            }}</span
                                                        >
                                                        <span
                                                            v-if="
                                                                item.producto
                                                                    .tipo ===
                                                                'PRODUCTO'
                                                            "
                                                            ><i
                                                                class="fas fa-cubes me-1"
                                                            ></i
                                                            >Stock:
                                                            {{
                                                                item.producto
                                                                    .stock_total
                                                            }}</span
                                                        >
                                                        <span
                                                            v-if="
                                                                item.producto
                                                                    .tipo ===
                                                                'SERVICIO'
                                                            "
                                                            ><i
                                                                class="fas fa-clock me-1"
                                                            ></i
                                                            >Servicio</span
                                                        >
                                                        <span
                                                            v-if="
                                                                item.producto
                                                                    .tipo ===
                                                                'PLAN'
                                                            "
                                                            ><i
                                                                class="fas fa-calendar me-1"
                                                            ></i
                                                            >Plan</span
                                                        >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-4 col-sm-3 col-lg-2">
                                            <label
                                                class="form-label text-muted small mb-1"
                                                >Cant.</label
                                            >
                                            <input
                                                type="number"
                                                min="1"
                                                class="form-control form-control-sm text-center fw-bold"
                                                v-model.number="item.cantidad"
                                                @input="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                                @change="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                            />
                                        </div>

                                        <div class="col-8 col-sm-3 col-lg-2">
                                            <label
                                                class="form-label text-muted small mb-1"
                                                >Precio Bs.</label
                                            >
                                            <input
                                                type="number"
                                                min="0"
                                                step="0.01"
                                                class="form-control text-end"
                                                v-model.number="item.precio"
                                                @input="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                                @change="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                            />
                                        </div>
                                        <div class="col-8 col-sm-4 col-lg-2">
                                            <label
                                                class="form-label text-muted small mb-1"
                                                >Total</label
                                            >
                                            <div
                                                class="form-control form-control-sm text-end fw-bold subtotal-box"
                                            >
                                                Bs.
                                                {{
                                                    Number(
                                                        item.total_sd || 0,
                                                    ).toFixed(2)
                                                }}
                                            </div>
                                        </div>

                                        <div
                                            class="col-4 col-sm-2 col-lg-auto text-end"
                                        >
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-danger border-0"
                                                title="Quitar concepto"
                                                @click="quitarFila(item, index)"
                                            >
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </div>
                                    </div>

                                    <div class="concept-financial-summary">
                                        <div>
                                            <span>Desc. concepto</span>
                                            <strong
                                                class="text-discount fw-bold"
                                                >-Bs.
                                                {{
                                                    Number(
                                                        item.tm_descuento_uni,
                                                    ).toFixed(2)
                                                }}
                                                ({{
                                                    Number(
                                                        item.tp_descuento_uni,
                                                    ) || 0
                                                }}%)</strong
                                            >
                                        </div>
                                        <div>
                                            <span>Precio finalsasdasd</span>
                                            <strong class="text-total"
                                                >Bs.
                                                {{
                                                    Number(
                                                        item.total_uni ||
                                                            item.precio_venta ||
                                                            0,
                                                    ).toFixed(2)
                                                }}</strong
                                            >
                                        </div>
                                    </div>

                                    <!-- PROMOCIONES / DESCUENTOS: EJEMPLO VISUAL -->
                                    <!-- FUTURO: reemplazar estos ejemplos por item.promociones e item.descuentos -->
                                    <details class="discount-details mt-2">
                                        <summary
                                            class="d-flex align-items-center justify-content-between gap-2"
                                        >
                                            <span
                                                class="d-flex align-items-center gap-2 text-danger small fw-semibold"
                                            >
                                                <i class="fas fa-tags"></i>
                                                Promociones y descuentos
                                            </span>
                                            <span
                                                class="d-flex align-items-center gap-2"
                                            >
                                                <span
                                                    class="badge discount-count-badge"
                                                    >{{
                                                        item.detalle_promocions
                                                            .length
                                                    }}
                                                    aplicados</span
                                                >
                                                <i
                                                    class="fas fa-chevron-down text-muted details-arrow"
                                                ></i>
                                            </span>
                                        </summary>

                                        <div class="concept-details-body">
                                            <div
                                                class="discount-item discount-item-promotion"
                                                v-for="item_promocion in item.detalle_promocions"
                                            >
                                                <span
                                                    ><i
                                                        class="fas fa-tag me-2"
                                                    ></i
                                                    >{{
                                                        item_promocion.promocion
                                                            .nombre
                                                    }}</span
                                                >
                                                <strong
                                                    v-if="
                                                        item_promocion.porcentaje_monto ==
                                                        'PORCENTAJE'
                                                    "
                                                    >-
                                                    {{
                                                        item_promocion.porcentaje
                                                    }}
                                                    %</strong
                                                >
                                                <strong v-else
                                                    >-
                                                    {{ item_promocion.monto }}
                                                    Bs.</strong
                                                >
                                            </div>
                                            <div
                                                class="discount-item discount-item-manual"
                                            >
                                                <span
                                                    ><i
                                                        class="fas fa-hand-pointer me-2"
                                                    ></i
                                                    >Descuento
                                                    independiente</span
                                                >
                                                <div
                                                    class="input-group input-group-sm discount-manual-input"
                                                >
                                                    <span
                                                        class="input-group-text"
                                                        >Bs.</span
                                                    >
                                                    <!-- FUTURO: conectar con descuento_uni -->
                                                    <input
                                                        v-model="
                                                            item.descuento_uni
                                                        "
                                                        type="number"
                                                        class="form-control text-end"
                                                        min="0"
                                                        step="0.01"
                                                        placeholder="0.00"
                                                        @keyup="
                                                            detectarCambioFila(
                                                                item,
                                                                index,
                                                            )
                                                        "
                                                        @change="
                                                            detectarCambioFila(
                                                                item,
                                                                index,
                                                            )
                                                        "
                                                    />
                                                </div>
                                            </div>

                                            <!-- FUTURO: conectar con agregarPromocion -->
                                            <!-- <button
                                                type="button"
                                                class="btn btn-sm btn-outline-danger mt-2 compact-action-btn"
                                            >
                                                <i class="fas fa-sync me-1"></i>
                                                Buscar promociones
                                            </button> -->
                                        </div>
                                    </details>

                                    <!-- PLAN: BLOQUE PLEGABLE VISUAL -->
                                    <div
                                        v-if="item.producto.tipo === 'PLAN'"
                                        class="mt-2"
                                    >
                                        <details class="plan-assignment">
                                            <summary
                                                class="d-flex align-items-center justify-content-between gap-2"
                                            >
                                                <span
                                                    class="d-flex align-items-center gap-2 text-success small fw-semibold"
                                                    ><i class="fas fa-users"></i
                                                    >Beneficiarios del
                                                    plan</span
                                                >
                                                <span
                                                    class="d-flex align-items-center gap-2"
                                                    ><span
                                                        class="badge bg-success-subtle text-success"
                                                    >
                                                        0 /
                                                        {{ item.cantidad }}
                                                        cupos </span
                                                    ><i
                                                        class="fas fa-chevron-down text-muted details-arrow"
                                                    ></i
                                                ></span>
                                            </summary>
                                            <div
                                                class="plan-assignment-body mt-2 p-2 pt-0 rounded"
                                            >
                                                <div
                                                    class="d-flex justify-content-between align-items-center gap-2 mb-1"
                                                >
                                                    <!-- FUTURO: conectar con agregarAsignacionPlan -->
                                                    <!-- <button
                                                        type="button"
                                                        class="btn btn-sm btn-outline-success compact-action-btn"
                                                    >
                                                        <i
                                                            class="fas fa-user-plus me-1"
                                                        ></i
                                                        >Agregar
                                                    </button> -->
                                                </div>
                                                <!-- FUTURO: reemplazar por las asignaciones reales -->
                                                <div
                                                    class="row g-2 align-items-center"
                                                    v-for="(
                                                        item_inscripcion,
                                                        index_inscripcion
                                                    ) in item.inscripcions"
                                                >
                                                    <div class="col-7">
                                                        <!-- abrir selector de cliente o modal de asignación -->
                                                        <label
                                                            data-v-c9b569fb=""
                                                            class="form-label text-muted small mb-1"
                                                            ><i
                                                                class="fa fa-user"
                                                            ></i>
                                                            Beneficiario
                                                            {{
                                                                index_inscripcion +
                                                                1
                                                            }}
                                                        </label>
                                                        <el-select
                                                            v-model="
                                                                item_inscripcion.cliente_id
                                                            "
                                                            class="w-100"
                                                            size="small"
                                                            no-data-text="Sin datos"
                                                            no-match-text="Sin resultados"
                                                            loading-text="Buscando..."
                                                            placeholder="Seleccionar cliente"
                                                            filterable
                                                            remote
                                                            clearable
                                                            :remote-method="
                                                                buscarClientes
                                                            "
                                                            :loading="
                                                                cargandoClientes
                                                            "
                                                            :reserve-keyword="
                                                                true
                                                            "
                                                            @change="
                                                                detectarCambioFila(
                                                                    item,
                                                                    index,
                                                                )
                                                            "
                                                        >
                                                            <el-option
                                                                v-for="item in listClientes"
                                                                :key="item.id"
                                                                :value="item.id"
                                                                :label="`${item.full_name} - ${item.full_ci}`"
                                                            />
                                                        </el-select>
                                                    </div>
                                                    <div class="col-5">
                                                        <label
                                                            data-v-c9b569fb=""
                                                            class="form-label text-muted small mb-1"
                                                            ><i
                                                                class="fa fa-calendar-alt"
                                                            ></i>
                                                            Inicio</label
                                                        >
                                                        <input
                                                            type="date"
                                                            class="form-control form-control-sm text-center"
                                                            v-model="
                                                                item_inscripcion.fecha_inicio
                                                            "
                                                        />
                                                    </div>
                                                </div>
                                            </div>
                                        </details>
                                    </div>

                                    <!-- SERVICIO: BLOQUE PLEGABLE VISUAL -->
                                    <div
                                        v-if="item.producto.tipo === 'SERVICIO'"
                                        class="mt-2"
                                    >
                                        <details class="service-info">
                                            <summary
                                                class="d-flex align-items-center gap-2 text-info small fw-semibold"
                                            >
                                                <i
                                                    class="fas fa-info-circle"
                                                ></i
                                                >Configurar servicio<i
                                                    class="fas fa-chevron-down text-muted details-arrow ms-auto"
                                                ></i>
                                            </summary>
                                            <div
                                                class="service-info-body mt-2 p-2 rounded small text-muted"
                                            >
                                                <!-- FUTURO: agregar fecha, horario o duración -->
                                                Aquí se podrán configurar la
                                                fecha, duración y horario.
                                            </div>
                                        </details>
                                    </div>
                                </div>
                            </div>

                            <div v-else class="text-center text-muted py-4">
                                <i
                                    class="fas fa-shopping-basket fa-2x mb-2 text-secondary"
                                ></i>
                                <div class="small">
                                    Aún no hay conceptos agregados
                                </div>
                            </div>
                        </div>

                        <!-- TIPO DE VENTA -->
                        <details class="section-details">
                            <summary
                                class="section-summary section-summary-primary"
                            >
                                <span class="section-summary-icon"
                                    ><i class="fas fa-file-invoice-dollar"></i
                                ></span>
                                <span class="flex-grow-1"
                                    ><strong class="d-block"
                                        >Tipo de venta</strong
                                    ><small
                                        >Define cómo se registrará la
                                        venta</small
                                    ></span
                                >
                                <span class="badge section-summary-value">
                                    {{
                                        tipo_ventas.find(
                                            (item) =>
                                                item.value === form.tipo_venta,
                                        )?.label || "Sin seleccionar"
                                    }}
                                </span>
                                <i
                                    class="fas fa-chevron-down section-arrow"
                                ></i>
                            </summary>
                            <div class="px-3 py-3">
                                <el-radio-group
                                    v-model="form.tipo_venta"
                                    class="row g-2 w-100"
                                    @change="cambiarTipoVenta"
                                >
                                    <div
                                        v-for="item in tipo_ventas"
                                        :key="item.value"
                                        class="col-12 col-sm-6"
                                    >
                                        <div
                                            class="border rounded p-2 h-100 sale-type-option cursor-pointer"
                                            :class="{
                                                'sale-type-selected':
                                                    form.tipo_venta ===
                                                    item.value,
                                            }"
                                            @click="
                                                form.tipo_venta = item.value
                                            "
                                        >
                                            <div
                                                class="d-flex align-items-center justify-content-between"
                                            >
                                                <i
                                                    :class="item.icon"
                                                    class="text-primary"
                                                ></i>
                                                <i
                                                    v-if="
                                                        form.tipo_venta ===
                                                        item.value
                                                    "
                                                    class="fas fa-check-circle text-primary"
                                                ></i>
                                                <i
                                                    v-else
                                                    class="far fa-circle text-muted"
                                                ></i>
                                            </div>
                                            <div class="fw-bold small mt-2">
                                                {{ item.label }}
                                            </div>
                                            <small class="text-muted">{{
                                                item.value === "contado"
                                                    ? "Pago inmediato"
                                                    : "Pago pendiente o en cuotas"
                                            }}</small>
                                        </div>
                                    </div>
                                </el-radio-group>
                            </div>
                        </details>

                        <!-- DESCUENTO -->
                        <details class="section-details">
                            <summary
                                class="section-summary section-summary-discount"
                            >
                                <span class="section-summary-icon"
                                    ><i class="fas fa-tag"></i
                                ></span>
                                <span class="flex-grow-1"
                                    ><strong class="d-block">Descuento</strong
                                    ><small
                                        >Ajusta el importe final de la
                                        venta</small
                                    ></span
                                >
                                <span class="badge section-summary-value"
                                    >Bs.
                                    {{
                                        Number(form.descuento || 0).toFixed(2)
                                    }}</span
                                >
                                <i
                                    class="fas fa-chevron-down section-arrow"
                                ></i>
                            </summary>
                            <div class="px-3 py-2">
                                <div class="discount-total-row mb-0">
                                    <span>
                                        <i class="fas fa-tags me-2"></i>
                                        Descuentos de conceptos
                                    </span>
                                    <strong class="text-discount">
                                        -Bs.
                                        {{
                                            form.venta_detalles
                                                .reduce(
                                                    (total, item) =>
                                                        total +
                                                        Number(
                                                            item.descuento_uni ||
                                                                0,
                                                        ) *
                                                            Number(
                                                                item.cantidad ||
                                                                    0,
                                                            ),
                                                    0,
                                                )
                                                .toFixed(2)
                                        }}
                                    </strong>
                                </div>

                                <label
                                    for="descuento"
                                    class="form-label small fw-bold"
                                    >Descuento final de venta</label
                                >
                                <div class="input-group">
                                    <span class="input-group-text">Bs.</span>
                                    <input
                                        id="descuento"
                                        type="number"
                                        class="form-control"
                                        v-model.number="form.descuento"
                                        min="0"
                                        step="0.01"
                                        placeholder="0.00"
                                        @change="aplicarDescuentosTotal"
                                    />
                                </div>
                                <small class="text-muted d-block mt-1 text-xs"
                                    >Este descuento se aplica después de los
                                    descuentos propios de cada concepto.</small
                                >
                            </div>
                        </details>

                        <!-- MÉTODOS DE PAGO -->
                        <details class="section-details">
                            <summary
                                class="section-summary section-summary-success"
                            >
                                <span class="section-summary-icon"
                                    ><i class="fas fa-credit-card"></i
                                ></span>
                                <span class="flex-grow-1"
                                    ><strong class="d-block"
                                        >Métodos de pago</strong
                                    ><small
                                        >Selecciona cómo se realizará el
                                        pago</small
                                    ></span
                                >
                                <el-popover
                                    placement="top"
                                    width="260"
                                    trigger="hover"
                                >
                                    <div class="payment-popover">
                                        <div class="fw-bold small mb-2">
                                            Métodos asignados
                                        </div>

                                        <div
                                            v-if="
                                                metodo_pagos.filter(
                                                    (item) => item.seleccionado,
                                                ).length === 0
                                            "
                                            class="text-muted small"
                                        >
                                            No hay métodos seleccionados.
                                        </div>

                                        <div v-else>
                                            <div
                                                v-for="metodo in metodo_pagos.filter(
                                                    (item) => item.seleccionado,
                                                )"
                                                :key="metodo.id"
                                                class="d-flex justify-content-between align-items-center gap-2 py-1 border-bottom"
                                            >
                                                <span
                                                    class="small text-truncate"
                                                    >{{ metodo.nombre }}</span
                                                >
                                                <strong
                                                    class="small text-nowrap"
                                                    >Bs.
                                                    {{
                                                        metodo.monto || "0.00"
                                                    }}</strong
                                                >
                                            </div>
                                        </div>
                                    </div>

                                    <template #reference>
                                        <span
                                            class="badge section-summary-value payment-summary-badge"
                                        >
                                            {{
                                                metodo_pagos.filter(
                                                    (item) => item.seleccionado,
                                                ).length
                                            }}
                                        </span>
                                    </template>
                                </el-popover>
                                <i
                                    class="fas fa-chevron-down section-arrow"
                                ></i>
                            </summary>
                            <div class="px-3 py-3">
                                <div
                                    v-for="metodo_pago in metodo_pagos"
                                    :key="metodo_pago.id"
                                    class="border rounded p-2 mb-2 payment-option"
                                    :class="{
                                        'payment-selected':
                                            metodo_pago.seleccionado,
                                    }"
                                    @click="
                                        metodo_pago.seleccionado =
                                            !metodo_pago.seleccionado
                                    "
                                >
                                    <div
                                        class="d-flex align-items-center gap-2"
                                    >
                                        <div class="payment-icon">
                                            <i :class="metodo_pago.icon"></i>
                                        </div>
                                        <div class="flex-grow-1 min-width-0">
                                            <div class="fw-bold small">
                                                {{ metodo_pago.nombre }}
                                            </div>
                                            <small
                                                class="text-muted text-truncate d-block"
                                                >{{
                                                    metodo_pago.descripcion
                                                }}</small
                                            >
                                        </div>
                                        <i
                                            v-if="metodo_pago.seleccionado"
                                            class="fas fa-check-circle text-primary"
                                        ></i>
                                    </div>
                                    <div
                                        v-if="metodo_pago.seleccionado"
                                        class="mt-2"
                                        @click.stop
                                    >
                                        <el-input
                                            v-model="metodo_pago.monto"
                                            type="number"
                                            min="0"
                                            placeholder="Monto a pagar"
                                        >
                                            <template #prepend>Bs.</template>
                                        </el-input>
                                    </div>
                                </div>
                            </div>
                        </details>

                        <!-- TOTALES -->
                        <div class="p-3 bg-light">
                            <div
                                class="d-flex justify-content-between mb-2 small"
                            >
                                <span class="text-muted"
                                    ><i class="fas fa-calculator me-2"></i
                                    >Subtotal</span
                                >
                                <strong
                                    >Bs. {{ subTotalVenta.toFixed(2) }}</strong
                                >
                            </div>
                            <div
                                class="d-flex justify-content-between mb-2 small"
                            >
                                <span class="text-muted"
                                    ><i class="fas fa-tag me-2"></i
                                    >Descuento</span
                                >
                                <strong class="text-discount"
                                    >Bs.
                                    {{
                                        Number(form.descuento || 0).toFixed(2)
                                    }}</strong
                                >
                            </div>
                            <hr />
                            <div
                                class="d-flex justify-content-between align-items-center"
                            >
                                <span class="fw-bold text-total"
                                    ><i class="fas fa-shopping-cart me-2"></i
                                    >Total</span
                                >
                                <strong class="fs-4 text-total"
                                    >Bs. {{ totalVenta.toFixed(2) }}</strong
                                >
                            </div>
                            <div
                                class="d-flex justify-content-between mt-2 small"
                            >
                                <span class="text-balance"
                                    ><i class="fas fa-wallet me-2"></i>Saldo
                                    pendiente</span
                                >
                                <strong class="text-balance"
                                    >Bs. {{ saldoVenta.toFixed(2) }}</strong
                                >
                            </div>
                        </div>

                        <!-- ACCIONES -->
                        <div class="card-footer bg-white p-3">
                            <button
                                type="button"
                                class="btn btn-primary btn-lg w-100"
                                :disabled="enviando"
                                @click.prevent="enviarFormulario"
                                v-html="textBtn"
                            ></button>
                            <button
                                type="button"
                                class="btn btn-light w-100 mt-2"
                                @click="cancelarVenta"
                                v-html="txtBtnCancelar"
                            ></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</template>
<style scoped src="@/assets/css/venta.css"></style>
