<script setup>
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import { router } from "@inertiajs/vue3";
import { watch, ref, computed, onMounted, nextTick } from "vue";
import FormularioCliente from "../Clientes/FormularioCliente.vue";
import { useClientes } from "@/composables/clientes/useClientes";
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

const agregarProductoVenta = async (item) => {
    const stock_total = Number(item.stock_total);
    let precio = Number(item.precio_venta);
    let cliente_producto_precio = obtenerPrecioClienteProducto(item.id);
    if (cliente_producto_precio > -1) {
        precio = cliente_producto_precio;
    }
    const cantidad = Number(item.cantidad);

    if (item.tipo == "PRODUCTO" && (!stock_total || stock_total < cantidad)) {
        toast.error("Stock insuficiente para agregar el producto");
        return;
    }
    if (!precio || precio <= 0) {
        toast.error("Debe ingresar un precio valido");
        return;
    }

    if (!cantidad || cantidad <= 0) {
        toast.error("Debe ingresar una cantidad valido");
        return;
    }

    // if (!tipo_venta_id || tipo_venta_id == "") {
    //     toast.error("Debe seleccionar un tipo de venta");
    //     return;
    // }

    try {
        const resp = await axios.get(route("productos.show", item.id));
        const producto = resp.data;
        const subtotal = cantidad * precio;

        const indexExiste = form.venta_detalles.findIndex(
            (elem) => elem.producto_id == producto.id,
        );
        // console.log(indexExiste);
        if (indexExiste < 0) {
            // no existe
            form.venta_detalles.push({
                id: 0,
                venta_id: "",
                producto: producto,
                producto_id: producto.id,
                cantidad: cantidad,
                precio: precio,
                descuento_uni: 0,
                porcen_du: 0,
                descuento_total: 0,
                porcen_dt: 0,
                precio_final: precio,
                total: subtotal.toFixed(2),
                total_uni: subtotal.toFixed(2),
            });
        } else {
            // existe
            const cantidadFila = form.venta_detalles[indexExiste].cantidad;
            const nuevaCantidad =
                parseFloat(cantidad) + parseFloat(cantidadFila);
            const total_uni =
                nuevaCantidad *
                (precio -
                    parseFloat(form.venta_detalles[indexExiste].descuento_uni));
            const total =
                nuevaCantidad *
                (precio -
                    (parseFloat(
                        form.venta_detalles[indexExiste].descuento_uni,
                    ) +
                        parseFloat(
                            form.venta_detalles[indexExiste].descuento_total,
                        )));

            form.venta_detalles[indexExiste].cantidad = nuevaCantidad;
            form.venta_detalles[indexExiste].total = total.toFixed(2);
            form.venta_detalles[indexExiste].total_uni = total_uni.toFixed(2);
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
    }
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
            const con_descuento = elem.precio - elem.descuento_uni;
            elem.porcen_dt = porcentaje;
            elem.descuento_total = con_descuento * (porcentaje / 100);
            elem.total_uni = elem.cantidad * con_descuento;
            elem.total_uni = parseFloat(elem.total_uni).toFixed(2);

            // TOTAL PARA CALCULAR GANANCIA BRUTA
            elem.precio_final = con_descuento - elem.descuento_total;
            console.log(elem.precio_final);
            elem.total = elem.cantidad * elem.precio_final;
        });
    }
};

const detectarCambioFila = (item, index) => {
    const cant = Number(item.cantidad);
    const precio = Number(item.precio);
    const descuento_uni = Number(item.descuento_uni ?? 0);
    const descuento_total = Number(item.descuento_total ?? 0);
    if (!cant || !precio) {
        return;
    }
    const total_uni = cant * (precio - parseFloat(descuento_uni));
    const total =
        cant *
        (precio - (parseFloat(descuento_uni) + parseFloat(descuento_total)));
    form.venta_detalles[index].total_uni = total_uni.toFixed(2);
    form.venta_detalles[index].total = total.toFixed(2);
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

    if (index !== null) {
        if (cantidad > item_sucursal_origen.stock_aux) {
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
                <div class="col-12 col-xl-7">
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
                <div class="col-12 col-xl-5">
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

                        <div class="card-body border-bottom">
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

                            <div class="row g-2 mt-2">
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

                            <div class="mt-3">
                                <label class="form-label small fw-bold"
                                    >Cliente</label
                                >
                                <div class="input-group">
                                    <div class="form-control p-0 border-0">
                                        <el-select
                                            v-model="form.cliente_id"
                                            class="w-100"
                                            no-data-text="Sin datos"
                                            no-match-text="Sin resultados"
                                            loading-text="Buscando..."
                                            placeholder="Buscar cliente"
                                            filterable
                                            remote
                                            clearable
                                            :remote-method="buscarClientes"
                                            :loading="cargandoClientes"
                                            :reserve-keyword="true"
                                            @change="buscarClienteProductos()"
                                        >
                                            <el-option
                                                v-for="item in listClientes"
                                                :key="item.id"
                                                :value="item.id"
                                                :label="`${item.nombre} - ${item.tipo_documento?.nombre ?? ''}: ${item.nro_documento}`"
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

                            <div
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
                            </div>
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
                                                >Precio</label
                                            >
                                            <div
                                                class="input-group input-group-sm"
                                            >
                                                <span class="input-group-text"
                                                    >Bs.</span
                                                >
                                                <input
                                                    type="number"
                                                    min="0"
                                                    step="0.01"
                                                    class="form-control text-end"
                                                    v-model.number="
                                                        item.precio_venta
                                                    "
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
                                                        item.total ||
                                                            item.total_uni ||
                                                            0,
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
                                            <strong class="text-discount"
                                                >-Bs.
                                                {{
                                                    (
                                                        Number(
                                                            item.descuento_uni ||
                                                                0,
                                                        ) *
                                                        Number(
                                                            item.cantidad || 0,
                                                        )
                                                    ).toFixed(2)
                                                }}</strong
                                            >
                                        </div>
                                        <div>
                                            <span>Precio final</span>
                                            <strong class="text-total"
                                                >Bs.
                                                {{
                                                    Number(
                                                        item.precio_final ||
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
                                                    >3 aplicados</span
                                                >
                                                <i
                                                    class="fas fa-chevron-down text-muted details-arrow"
                                                ></i>
                                            </span>
                                        </summary>

                                        <div class="concept-details-body">
                                            <div
                                                class="discount-item discount-item-promotion"
                                            >
                                                <span
                                                    ><i
                                                        class="fas fa-tag me-2"
                                                    ></i
                                                    >Promoción Black
                                                    Friday</span
                                                >
                                                <strong>-20%</strong>
                                            </div>

                                            <div
                                                class="discount-item discount-item-promotion"
                                            >
                                                <span
                                                    ><i
                                                        class="fas fa-tag me-2"
                                                    ></i
                                                    >Promoción cliente
                                                    frecuente</span
                                                >
                                                <strong>-Bs. 5.00</strong>
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
                                                        type="number"
                                                        class="form-control text-end"
                                                        min="0"
                                                        step="0.01"
                                                        placeholder="0.00"
                                                    />
                                                </div>
                                            </div>

                                            <!-- FUTURO: conectar con agregarPromocion -->
                                            <button
                                                type="button"
                                                class="btn btn-sm btn-outline-danger mt-2 compact-action-btn"
                                            >
                                                <i class="fas fa-plus me-1"></i>
                                                Agregar promoción
                                            </button>
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
                                                        {{
                                                            item.cantidad
                                                        }}
                                                        cupos </span
                                                    ><i
                                                        class="fas fa-chevron-down text-muted details-arrow"
                                                    ></i
                                                ></span>
                                            </summary>
                                            <div
                                                class="plan-assignment-body mt-2 p-2 rounded"
                                            >
                                                <div
                                                    class="d-flex justify-content-between align-items-center gap-2 mb-2"
                                                >
                                                    <small class="text-muted"
                                                        >Asigna los cupos a uno
                                                        o varios
                                                        clientes.</small
                                                    >
                                                    <!-- FUTURO: conectar con agregarAsignacionPlan -->
                                                    <button
                                                        type="button"
                                                        class="btn btn-sm btn-outline-success compact-action-btn"
                                                    >
                                                        <i
                                                            class="fas fa-user-plus me-1"
                                                        ></i
                                                        >Agregar
                                                    </button>
                                                </div>
                                                <!-- FUTURO: reemplazar por las asignaciones reales -->
                                                <div
                                                    class="row g-2 align-items-center"
                                                >
                                                    <div class="col-8">
                                                        <!-- FUTURO: abrir selector de cliente o modal de asignación -->
                                                        <button
                                                            type="button"
                                                            class="btn btn-sm btn-outline-success w-100 text-start compact-action-btn"
                                                        >
                                                            <i
                                                                class="fas fa-user-plus me-2"
                                                            ></i>
                                                            Seleccionar cliente
                                                        </button>
                                                    </div>
                                                    <div class="col-3">
                                                        <input
                                                            type="number"
                                                            class="form-control form-control-sm text-center"
                                                            min="1"
                                                            value="1"
                                                        />
                                                    </div>
                                                    <div class="col-1 text-end">
                                                        <button
                                                            type="button"
                                                            class="btn btn-sm btn-outline-danger border-0"
                                                        >
                                                            <i
                                                                class="fas fa-times"
                                                            ></i>
                                                        </button>
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
                                            class="border rounded p-2 h-100 sale-type-option"
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
                            <div class="px-3 py-3">
                                <div class="discount-total-row mb-3">
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
                                <small class="text-muted d-block mt-1"
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

<style>
.min-width-0 {
    min-width: 0;
}
.catalog-quantity {
    width: 75px;
}

.product-row {
    transition:
        background-color 0.15s ease,
        border-left-color 0.15s ease;
}

.product-row:hover {
    background-color: var(--bg6);
    border-left: 3px solid var(--bgBlue);
}

.section-heading {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    padding: 0.75rem 1rem;
    border-bottom: 1px solid var(--bgGrayLight);
    border-left: 4px solid transparent;
}

.section-heading-primary {
    background-color: var(--bgPrimary2);
    border-left-color: var(--bgPrimary);
}

.section-heading-info {
    margin: -1rem -1rem 0;
    padding-right: 1rem;
    padding-left: 1rem;
    background-color: var(--bgInfo2);
    border-left-color: var(--bgInfo);
}

.section-heading-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    border-radius: 8px;
    background-color: var(--bgWhite);
}

.section-heading-primary .section-heading-icon {
    color: var(--bgPrimary);
}
.section-heading-info .section-heading-icon {
    color: var(--bgInfo);
}

.section-heading strong {
    color: var(--bgDarkPrincipal);
    font-size: 0.86rem;
}

.section-heading small {
    display: block;
    margin-top: 2px;
    color: var(--bg5);
    font-size: 0.7rem;
}

.section-heading-badge {
    color: var(--bgPrimary);
    background-color: var(--bgWhite);
}

.section-details {
    border-bottom: 1px solid var(--bgGrayLight);
}

.section-summary {
    display: flex;
    align-items: center;
    gap: 0.65rem;
    min-height: 58px;
    padding: 0.7rem 1rem;
    cursor: pointer;
    list-style: none;
}

.section-summary::-webkit-details-marker {
    display: none;
}

.section-summary strong {
    color: var(--bgDarkPrincipal);
    font-size: 0.82rem;
}

.section-summary small {
    display: block;
    margin-top: 2px;
    color: var(--bg5);
    font-size: 0.7rem;
}

.section-summary-primary {
    background-color: rgba(217, 233, 252, 0.45);
    border-left: 4px solid var(--bgPrimary);
}

.section-summary-discount {
    background-color: rgba(255, 237, 213, 0.45);
    border-left: 4px solid var(--bgDescuento);
}

.section-summary-success {
    background-color: rgba(205, 247, 233, 0.45);
    border-left: 4px solid var(--bgSuccess);
}

.section-summary-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    border-radius: 8px;
    flex-shrink: 0;
}

.section-summary-primary .section-summary-icon {
    color: var(--bgPrimary);
    background-color: var(--bgPrimary2);
}
.section-summary-discount .section-summary-icon {
    color: var(--bgDescuento);
    background-color: var(--bgDescuentoLight);
}
.section-summary-success .section-summary-icon {
    color: var(--bgSuccess);
    background-color: var(--bgSuccess2);
}

.section-summary-value {
    color: var(--bg5);
    background-color: var(--bgWhite);
    font-size: 0.7rem;
}

.payment-summary-badge {
    cursor: pointer;
}

.payment-popover {
    max-width: 230px;
}

.payment-popover .border-bottom:last-child {
    border-bottom: 0 !important;
}

.payment-popover {
    max-width: 230px;
}

.payment-popover .border-bottom:last-child {
    border-bottom: 0 !important;
}

.section-arrow,
.details-arrow {
    color: var(--bg5);
    font-size: 0.7rem;
    transition: transform 0.2s ease;
}

.discount-details summary {
    color: var(--bgDescuento);
}

.discount-details .concept-details-body {
    border: 1px solid rgba(234, 88, 12, 0.2);
    background-color: var(--bgDescuentoLight);
}

.discount-count-badge {
    color: var(--bgDescuento);
    background-color: var(--bgWhite);
}

.discount-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.75rem;
    padding: 0.4rem 0;
    border-bottom: 1px solid rgba(234, 88, 12, 0.15);
    color: var(--bgDarkPrincipal);
    font-size: 0.72rem;
}

.discount-item:last-of-type {
    border-bottom: 0;
}

.discount-item strong {
    color: var(--bgDescuento);
    white-space: nowrap;
}

.discount-item-promotion i {
    color: var(--bgDescuento);
}

.discount-item-manual i {
    color: var(--bgDanger);
}

details[open] .section-arrow,
details[open] .details-arrow {
    transform: rotate(180deg);
}

.concept-list {
    padding: 0.45rem;
    background-color: var(--bgDarkPrincipal);
}

.concept-row {
    margin-bottom: 0.45rem;
    border: 1px solid var(--bgGrayLight) !important;
    border-left: 4px solid transparent !important;
    border-radius: 0.55rem;
    background-color: var(--bgWhite);
    transition:
        background-color 0.15s ease,
        box-shadow 0.15s ease;
}

.concept-row:last-child {
    margin-bottom: 0;
}

.concept-row:last-child {
    border-bottom: 0 !important;
}
.concept-row:hover {
    background-color: rgba(241, 245, 249, 0.45);
}

.concept-row-product {
    border-left: 4px solid var(--bgPrimary) !important;
}

.concept-row-service {
    border-left: 4px solid var(--bgInfo) !important;
}

.concept-row-plan {
    border-left: 4px solid var(--bgSuccess) !important;
}

.concept-icon {
    width: 34px;
    height: 34px;
    font-size: 14px;
}

.concept-icon-product {
    color: var(--bgPrimary);
    background-color: var(--bgPrimary2);
}
.concept-icon-service {
    color: var(--bgInfo);
    background-color: var(--bgInfo2);
}
.concept-icon-plan {
    color: var(--bgSuccess);
    background-color: var(--bgSuccess2);
}

.concept-badge-product {
    color: var(--bgPrimary);
    background-color: var(--bgPrimary2);
}
.concept-badge-service {
    color: var(--bgInfo);
    background-color: var(--bgInfo2);
}
.concept-badge-plan {
    color: var(--bgSuccess);
    background-color: var(--bgSuccess2);
}

.subtotal-box {
    color: var(--bgSubtotal);
    background-color: var(--bgSubtotalLight);
    border-color: var(--bgSubtotalLight);
}

.plan-assignment,
.service-info {
    padding-top: 0.5rem;
    border-top: 1px dashed var(--bgGrayLight);
}

.plan-assignment summary,
.service-info summary {
    cursor: pointer;
    list-style: none;
}

.plan-assignment summary::-webkit-details-marker,
.service-info summary::-webkit-details-marker {
    display: none;
}

.plan-assignment-body {
    background-color: var(--bgSuccess2);
    border: 1px solid rgba(23, 145, 104, 0.2);
}

.service-info-body {
    background-color: var(--bgInfo2);
    border: 1px solid rgba(19, 200, 206, 0.2);
}

.payment-option {
    cursor: pointer;
    transition:
        background-color 0.15s ease,
        border-color 0.15s ease,
        box-shadow 0.15s ease;
}

.payment-option:hover {
    border-color: var(--bgBlueLight) !important;
    background-color: var(--bgPrimary2);
}

.payment-selected,
.sale-type-selected {
    border-color: var(--bgBlue) !important;
    background-color: var(--bgPrimary2);
    box-shadow: 0 0 0 1px rgba(37, 99, 235, 0.12);
}

.payment-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    min-width: 32px;
    border-radius: 7px;
    color: var(--bgBlue);
    background-color: var(--bgPrimary2);
}

.payment-option .el-input-group__prepend {
    color: var(--bgBlue) !important;
    background-color: var(--bgPrimary2) !important;
    border-color: var(--bgBlueLight) !important;
    font-weight: 600;
}

.text-discount {
    color: var(--bgDescuento) !important;
}
.text-total {
    color: var(--bgTotal) !important;
}
.text-balance {
    color: var(--bgSaldo) !important;
}

.el-select {
    width: 100%;
}
.el-select .el-input__wrapper,
.el-input .el-input__wrapper {
    box-shadow: none !important;
}

@media (max-width: 767.98px) {
    .concept-list {
        padding: 0.25rem;
    }

    .catalog-quantity {
        width: 100%;
    }
    .concept-icon {
        width: 30px;
        height: 30px;
        font-size: 12px;
    }
    .section-heading,
    .section-summary {
        padding-right: 0.75rem;
        padding-left: 0.75rem;
    }
}
/* =====================================================
   AJUSTES FINALES DE CONCEPTOS Y DESCUENTOS
===================================================== */

.concept-list,
.list-group.list-group-flush {
    background-color: var(--bgGrayLight) !important;
}

.concept-row,
.list-group-item.concept-row {
    color: var(--bgDarkPrincipal) !important;
    background-color: var(--bgWhite) !important;
}

.concept-row:hover,
.list-group-item.concept-row:hover {
    color: var(--bgDarkPrincipal) !important;
    background-color: var(--bgWhiteSoft) !important;
}

.discount-details summary {
    color: var(--bgDescuento);
}

.discount-details .concept-details-body {
    padding: 0.65rem;
    border: 1px solid rgba(234, 88, 12, 0.2);
    border-radius: 0.4rem;
    background-color: var(--bgDescuentoLight);
}

.discount-count-badge {
    color: var(--bgDescuento);
    background-color: var(--bgWhite);
}

.discount-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 0.75rem;
    padding: 0.45rem 0;
    border-bottom: 1px solid rgba(234, 88, 12, 0.15);
    color: var(--bgDarkPrincipal);
    font-size: 0.72rem;
}

.discount-item:last-of-type {
    border-bottom: 0;
}

.discount-item strong {
    color: var(--bgDescuento);
    white-space: nowrap;
}

.discount-item-promotion i {
    color: var(--bgDescuento);
}

.discount-item-manual i {
    color: var(--bgDanger);
}

.discount-manual-input {
    width: 125px;
    flex-shrink: 0;
}

.discount-manual-input .input-group-text {
    color: var(--bgDescuento);
    background-color: var(--bgDescuentoLight);
    border-color: rgba(234, 88, 12, 0.25);
}

@media (max-width: 575.98px) {
    .discount-item {
        align-items: flex-start;
        flex-direction: column;
    }

    .discount-manual-input {
        width: 100%;
    }
}
/* =====================================================
   AJUSTE FINAL: CONCEPTOS COMPACTOS Y RESALTADOS
===================================================== */

.concept-list {
    padding: 0.45rem !important;
    background: linear-gradient(180deg, #e8edf3 0%, #dfe6ee 100%) !important;
}

.concept-row {
    margin-bottom: 0.45rem !important;
    padding: 0.65rem 0.7rem !important;
    color: #263238 !important;
    background-color: #ffffff !important;
    border-color: #cfd8e3 !important;
    box-shadow: 0 1px 2px rgba(15, 23, 42, 0.05);
    transition:
        transform 0.18s ease,
        box-shadow 0.18s ease,
        background-color 0.18s ease;
}

.concept-row:hover {
    z-index: 2;
    transform: translateY(-2px);
    color: #263238 !important;
    background-color: #f8fbff !important;
    box-shadow: 0 6px 16px rgba(15, 23, 42, 0.12);
}

.concept-row strong,
.concept-row .text-dark {
    color: #263238 !important;
    font-size: 0.78rem !important;
    line-height: 1.2;
}

.concept-row .text-muted,
.concept-row small,
.concept-meta {
    font-size: 0.63rem !important;
}

.concept-badge {
    padding: 0.18rem 0.38rem !important;
    font-size: 0.56rem !important;
}

.concept-row .form-label {
    margin-bottom: 0.15rem !important;
    font-size: 0.61rem !important;
}

.concept-row .form-control,
.concept-row .input-group-text {
    font-size: 0.7rem !important;
}

.concept-details summary {
    font-size: 0.64rem !important;
}

.discount-count-badge {
    padding: 0.18rem 0.38rem !important;
    font-size: 0.56rem !important;
}

.discount-item {
    font-size: 0.63rem !important;
}

.discount-item strong {
    font-size: 0.63rem !important;
}

.discount-manual-input {
    width: 112px;
}

.discount-manual-input .input-group-text,
.discount-manual-input .form-control {
    font-size: 0.64rem !important;
}

@media (max-width: 767.98px) {
    .concept-list {
        padding: 0.25rem !important;
    }

    .concept-row {
        padding: 0.58rem !important;
    }

    .concept-row strong,
    .concept-row .text-dark {
        font-size: 0.74rem !important;
    }
}
/* =====================================================
   AJUSTE FINAL: PROMOCIONES Y ACCIONES COMPACTAS
===================================================== */

.discount-details summary {
    padding: 0.05rem 0;
    font-size: 0.68rem;
}

.discount-details summary > span:first-child {
    font-size: 0.68rem;
}

.discount-count-badge {
    padding: 0.18rem 0.42rem;
    font-size: 0.58rem;
}

.discount-item {
    padding: 0.42rem 0;
    font-size: 0.72rem;
}

.discount-item strong {
    font-size: 0.7rem;
}

.discount-manual-input {
    width: 112px;
}

.compact-action-btn {
    padding: 0.22rem 0.48rem !important;
    font-size: 0.64rem !important;
    line-height: 1.2 !important;
}

.plan-assignment-body .compact-action-btn,
.discount-details .compact-action-btn {
    border-radius: 0.3rem;
}

.plan-assignment-body small {
    font-size: 0.64rem;
}

.plan-assignment-body .form-control,
.plan-assignment-body .btn {
    font-size: 0.64rem;
}
.concept-financial-summary {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 1rem;
    margin-top: 0.45rem;
    padding-top: 0.4rem;
    border-top: 1px dashed #d9dee5;
    color: var(--bg5);
    font-size: 0.64rem;
}

.concept-financial-summary > div {
    display: inline-flex;
    align-items: center;
    gap: 0.35rem;
}

.concept-financial-summary strong {
    font-size: 0.68rem;
}

.discount-total-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    padding: 0.6rem 0.7rem;
    border: 1px solid rgba(234, 88, 12, 0.18);
    border-radius: 0.4rem;
    color: var(--bg5);
    background-color: var(--bgDescuentoLight);
    font-size: 0.68rem;
}

.discount-total-row strong {
    white-space: nowrap;
}

@media (max-width: 575.98px) {
    .concept-financial-summary {
        justify-content: space-between;
        gap: 0.5rem;
    }
}
/* =====================================================
   AJUSTE FINAL: TIPOS DE VENTA, PAGOS Y POPOVER
===================================================== */

.sale-type-option {
    padding: 0.45rem 0.55rem !important;
}

.sale-type-option .fw-bold {
    font-size: 0.68rem !important;
    line-height: 1.15;
}

.sale-type-option small {
    display: block;
    font-size: 0.58rem !important;
    line-height: 1.15;
}

.sale-type-option > .d-flex i {
    font-size: 0.72rem;
}

.payment-option {
    padding: 0.45rem 0.55rem !important;
}

.payment-option .fw-bold {
    font-size: 0.68rem !important;
    line-height: 1.15;
}

.payment-option small {
    font-size: 0.58rem !important;
    line-height: 1.15;
}

.payment-option .payment-icon {
    width: 27px;
    height: 27px;
    min-width: 27px;
    font-size: 0.72rem;
}

.payment-option > .d-flex > .fa-check-circle {
    font-size: 0.75rem;
}

.discount-details summary {
    font-size: 0.78rem !important;
}

.discount-details summary > span:first-child {
    font-size: 0.78rem !important;
}

.discount-count-badge {
    padding: 0.22rem 0.48rem !important;
    font-size: 0.68rem !important;
}

.payment-summary-badge {
    cursor: help;
}
/* =====================================================
   AJUSTE FINAL: CATALOGO COMPACTO Y RESPONSIVE
===================================================== */

.product-row {
    padding: 0.6rem 0.75rem !important;
    color: var(--bgDarkPrincipal);
    transition:
        background-color 0.16s ease,
        box-shadow 0.16s ease;
}

.product-row:hover {
    background-color: #f8fbff;
    box-shadow: inset 3px 0 0 var(--bgPrimary);
}

.product-row .fw-bold {
    font-size: 0.78rem !important;
    line-height: 1.2;
}

.product-row .text-muted,
.product-row small,
.product-row .form-label {
    font-size: 0.64rem !important;
}

.product-row strong {
    font-size: 0.72rem;
}

.product-row .btn {
    padding: 0.28rem 0.55rem;
    font-size: 0.65rem;
}

.product-row .form-control,
.product-row .input-group-text {
    font-size: 0.7rem;
}

.catalog-quantity {
    min-width: 66px;
}

@media (max-width: 991.98px) {
    .product-row {
        padding: 0.55rem 0.65rem !important;
    }

    .product-row .row {
        row-gap: 0.45rem !important;
    }
}

@media (max-width: 575.98px) {
    .product-row .col-6,
    .product-row .col-12 {
        min-width: 0;
    }

    .product-row .fw-bold {
        font-size: 0.75rem !important;
    }

    .product-row .text-truncate {
        max-width: 100%;
    }

    .catalog-add-button {
        width: 100%;
        height: 30px;
    }

    .catalog-add-label {
        display: inline;
        margin-left: 0.35rem;
    }

    .card-body.bg-light.border-bottom {
        padding-top: 0.45rem !important;
        padding-bottom: 0.45rem !important;
    }
}
.catalog-add-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 34px;
    height: 30px;
    padding: 0 !important;
    border-radius: 0.35rem;
}

.catalog-add-label {
    display: none;
}

@media (max-width: 575.98px) {
    .catalog-add-button {
        width: 100%;
        height: 30px;
    }

    .catalog-add-label {
        display: inline;
        margin-left: 0.35rem;
    }
}
.catalog-search-body,
.catalog-search-empty {
    flex: 0 0 auto !important;
    height: auto !important;
    min-height: 0 !important;
    align-self: stretch;
}

.catalog-search-body .input-group {
    min-height: 34px;
}

.catalog-search-body .form-control,
.catalog-search-body .input-group-text,
.catalog-search-body .btn {
    min-height: 34px;
}

@media (max-width: 575.98px) {
    .catalog-search-body {
        padding-top: 0.45rem !important;
        padding-bottom: 0.45rem !important;
    }
}
.catalog-stock-insufficient {
    background-color: var(--bgStockInsufficient, #fff1f2) !important;
    border-left: 3px solid var(--textStockInsufficient, #b42318) !important;
    border-color: var(--borderStockInsufficient, #fecdd3) !important;
}

.catalog-stock-insufficient:hover {
    background-color: #ffe4e6 !important;
    box-shadow: inset 3px 0 0 var(--textStockInsufficient, #b42318);
}

.catalog-stock-insufficient .product-row,
.catalog-stock-insufficient .fw-bold {
    color: #7f1d1d !important;
}

.stock-warning {
    display: inline-flex;
    align-items: center;
    color: var(--textStockInsufficient, #b42318);
    font-size: 0.62rem;
    font-weight: 700;
}
</style>
