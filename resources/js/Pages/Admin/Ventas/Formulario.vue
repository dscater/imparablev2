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
                <!-- =====================================================
                     CATÁLOGO DE PRODUCTOS
                ====================================================== -->
                <div class="col-12 col-xl-7">
                    <div class="card border-0 shadow-sm">
                        <!-- ENCABEZADO -->
                        <div class="card-header bg-white border-bottom p-3">
                            <div class="row g-3 align-items-end">
                                <!-- TÍTULO -->
                                <div class="col-12 col-md-5">
                                    <div
                                        class="d-flex align-items-center gap-2"
                                    >
                                        <div
                                            class="d-flex align-items-center justify-content-center rounded-3 text-primary"
                                            style="
                                                width: 42px;
                                                height: 42px;
                                                background-color: var(
                                                    --bgPrimary2
                                                );
                                            "
                                        >
                                            <i class="fas fa-store"></i>
                                        </div>

                                        <div>
                                            <div class="fw-bold">
                                                Nueva venta
                                            </div>

                                            <small class="text-muted">
                                                Selecciona los productos para
                                                agregar
                                            </small>
                                        </div>
                                    </div>
                                </div>

                                <!-- SUCURSAL -->
                                <div class="col-12 col-md-7">
                                    <label
                                        class="form-label small fw-bold mb-1"
                                    >
                                        Sucursal
                                    </label>

                                    <div class="input-group">
                                        <span class="input-group-text">
                                            <i class="fas fa-building"></i>
                                        </span>

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
                                        class="text-danger list-unstyled mt-1 mb-0"
                                    >
                                        <li class="small">
                                            {{ form.errors.sucursal_id }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- BUSCADOR -->
                        <div class="card-body bg-light border-bottom">
                            <div
                                class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-2"
                            >
                                <div>
                                    <div class="fw-bold text-dark">
                                        <i class="fas fa-box-open me-2"></i>
                                        Productos
                                    </div>

                                    <small class="text-muted">
                                        Busca por código o nombre
                                    </small>
                                </div>

                                <button
                                    type="button"
                                    class="btn btn-outline-secondary btn-sm"
                                    @click.prevent="cargarProductos"
                                >
                                    <i class="fas fa-sync me-1"></i>
                                    Actualizar
                                </button>
                            </div>

                            <!-- INPUT NORMAL, SIN EL-INPUT -->
                            <div class="input-group">
                                <span class="input-group-text bg-white">
                                    <i class="fas fa-search"></i>
                                </span>

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

                        <!-- LISTADO DE PRODUCTOS -->
                        <div class="card-body p-0">
                            <!-- SIN SUCURSAL -->
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

                                <small>
                                    Primero selecciona una sucursal para ver sus
                                    productos.
                                </small>
                            </div>

                            <!-- CARGANDO -->
                            <div
                                v-else-if="loadingLista"
                                class="text-center text-muted py-5 px-3"
                            >
                                <i
                                    class="fas fa-spinner fa-spin fa-2x mb-3 text-primary"
                                ></i>

                                <div>Cargando productos...</div>
                            </div>

                            <!-- SIN PRODUCTOS -->
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

                                <small>
                                    Intenta actualizar o cambiar la búsqueda.
                                </small>
                            </div>

                            <!-- PRODUCTOS -->
                            <div v-else class="list-group list-group-flush">
                                <div
                                    v-for="item in listProductoSucursals"
                                    :key="item.id"
                                    class="list-group-item px-3 py-3 product-hover"
                                >
                                    <div class="row g-2 align-items-center">
                                        <!-- INFORMACIÓN DEL PRODUCTO -->
                                        <div class="col-12 col-lg">
                                            <div
                                                class="fw-bold text-dark text-truncate"
                                                :title="item.nombre"
                                            >
                                                {{ item.nombre }}
                                            </div>

                                            <div
                                                class="d-flex flex-wrap align-items-center gap-3 mt-1 text-muted small"
                                            >
                                                <span>
                                                    <i
                                                        class="fas fa-barcode me-1"
                                                    ></i>
                                                    {{ item.codigo }}
                                                </span>

                                                <span>
                                                    <i
                                                        class="fas fa-cubes me-1"
                                                    ></i>
                                                    Stock:

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
                                                    >
                                                        {{ item.stock_total }}
                                                    </strong>

                                                    <strong
                                                        v-else
                                                        class="text-success"
                                                    >
                                                        1
                                                    </strong>
                                                </span>
                                            </div>
                                        </div>

                                        <!-- PRECIO -->
                                        <div class="col-6 col-sm-4 col-lg-2">
                                            <div class="text-muted small">
                                                Precio
                                            </div>

                                            <strong class="text-dark">
                                                Bs. {{ item.precio }}
                                            </strong>
                                        </div>

                                        <!-- CANTIDAD -->
                                        <div class="col-6 col-sm-4 col-lg-2">
                                            <label
                                                class="form-label text-muted small mb-1"
                                            >
                                                Cantidad
                                            </label>

                                            <input
                                                type="number"
                                                class="form-control form-control-sm text-center"
                                                v-model="item.cantidad"
                                                min="1"
                                            />
                                        </div>

                                        <!-- AGREGAR -->
                                        <div class="col-12 col-sm-4 col-lg-2">
                                            <button
                                                type="button"
                                                class="btn btn-primary btn-sm w-100"
                                                @click.prevent="
                                                    agregarProductoVenta(item)
                                                "
                                            >
                                                <i class="fas fa-plus me-1"></i>
                                                Agregar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PAGINACIÓN -->
                        <div
                            v-if="sucursal_id"
                            class="card-footer bg-white d-flex flex-wrap justify-content-between align-items-center gap-2"
                        >
                            <small class="text-muted">
                                Total registros: {{ total_registros }}
                            </small>

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

                <!-- =====================================================
                     RESUMEN DE VENTA
                ====================================================== -->
                <div class="col-12 col-xl-5">
                    <div class="card border-0 shadow-sm sale-summary-card">
                        <!-- CABECERA DEL RESUMEN -->
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
                                        class="d-flex align-items-center justify-content-center rounded-3 flex-shrink-0"
                                        style="
                                            width: 42px;
                                            height: 42px;
                                            color: var(--bgSuccess);
                                            background-color: var(--bgWhite);
                                        "
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
                                            <span v-if="form.id != 0">
                                                Código:
                                                {{ form.codigo_venta }}
                                            </span>

                                            <span v-else> Nueva venta </span>
                                        </small>
                                    </div>
                                </div>

                                <span
                                    class="badge rounded-pill px-3 py-2 flex-shrink-0"
                                    style="
                                        color: var(--bgSuccess);
                                        background-color: var(--bgWhite);
                                    "
                                >
                                    {{ form.venta_detalles.length }}
                                    <span class="fw-normal"> items </span>
                                </span>
                            </div>
                        </div>

                        <!-- DATOS BÁSICOS -->
                        <div class="card-body border-bottom py-2">
                            <div class="d-flex align-items-center gap-2 mb-1">
                                <i class="fas fa-info-circle text-primary"></i>
                                <strong> Datos básicos </strong>
                            </div>

                            <div class="row g-2">
                                <div class="col-6">
                                    <label class="form-label small fw-bold">
                                        Fecha
                                    </label>

                                    <input
                                        type="date"
                                        class="form-control form-control-sm"
                                        v-model="form.fecha"
                                    />
                                </div>

                                <div class="col-6">
                                    <label class="form-label small fw-bold">
                                        Hora
                                    </label>

                                    <input
                                        type="time"
                                        class="form-control form-control-sm"
                                        v-model="form.hora"
                                    />
                                </div>
                            </div>

                            <!-- CLIENTE -->
                            <div class="mt-1">
                                <label class="form-label small fw-bold">
                                    Cliente
                                </label>

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
                                                :label="`${item.nombre} - ${
                                                    item.tipo_documento
                                                        ?.nombre ?? ''
                                                }: ${item.nro_documento}`"
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

                            <!-- PRODUCTOS ASIGNADOS -->
                            <div
                                v-if="listClienteProductos.length > 0"
                                class="alert alert-primary d-flex align-items-center justify-content-between gap-2 mt-3 mb-0 py-2"
                            >
                                <div class="d-flex align-items-center gap-2">
                                    <i class="fas fa-boxes"></i>

                                    <div>
                                        <strong class="d-block small">
                                            Productos asignados
                                        </strong>

                                        <small>
                                            {{ listClienteProductos.length }}
                                            productos
                                        </small>
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

                        <!-- PRODUCTOS AGREGADOS -->
                        <div class="card-body border-bottom">
                            <div
                                class="d-flex align-items-center justify-content-between mb-3"
                            >
                                <div class="d-flex align-items-center gap-2">
                                    <i
                                        class="fas fa-shopping-basket text-primary"
                                    ></i>

                                    <strong> Productos agregados </strong>
                                </div>

                                <span
                                    class="badge bg-primary-subtle text-primary rounded-pill"
                                >
                                    {{ form.venta_detalles.length }}
                                </span>
                            </div>

                            <div
                                v-if="form.venta_detalles.length > 0"
                                class="sale-products-list"
                            >
                                <div
                                    v-for="(item, index) in form.venta_detalles"
                                    :key="index"
                                    class="border rounded p-2 bg-light mb-2"
                                >
                                    <div
                                        class="d-flex align-items-center justify-content-between gap-2 mb-2"
                                    >
                                        <div
                                            class="d-flex align-items-center gap-2 min-width-0"
                                        >
                                            <span
                                                class="badge bg-primary rounded"
                                            >
                                                {{ index + 1 }}
                                            </span>

                                            <strong
                                                class="small text-truncate"
                                                :title="item.producto.nombre"
                                            >
                                                {{ item.producto.nombre }}
                                            </strong>
                                        </div>

                                        <button
                                            type="button"
                                            class="btn btn-sm btn-outline-danger border-0"
                                            title="Quitar producto"
                                            @click="quitarFila(item, index)"
                                        >
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>

                                    <div class="row g-2 align-items-end">
                                        <!-- CANTIDAD -->
                                        <div class="col-4">
                                            <label
                                                class="form-label small text-muted mb-1"
                                            >
                                                Cantidad
                                            </label>

                                            <input
                                                type="number"
                                                min="0"
                                                class="form-control form-control-sm text-center fw-bold"
                                                v-model="item.cantidad"
                                                @change="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                                @keyup="
                                                    detectarCambioFila(
                                                        item,
                                                        index,
                                                    )
                                                "
                                            />
                                        </div>

                                        <!-- PRECIO MODIFICABLE -->
                                        <div class="col-4">
                                            <label
                                                class="form-label small text-muted mb-1"
                                            >
                                                Precio
                                            </label>

                                            <div
                                                class="input-group input-group-sm"
                                            >
                                                <span class="input-group-text">
                                                    Bs.
                                                </span>

                                                <input
                                                    type="number"
                                                    class="form-control text-end"
                                                    v-model.number="
                                                        item.precio_venta
                                                    "
                                                    min="0"
                                                    step="0.01"
                                                    placeholder="0.00"
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

                                        <!-- SUBTOTAL -->
                                        <div class="col-4">
                                            <label
                                                class="form-label small text-primary mb-1"
                                            >
                                                Subtotal
                                            </label>

                                            <div
                                                class="form-control form-control-sm text-end fw-bold subtotal-box"
                                            >
                                                Bs. {{ item.total_uni }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div v-else class="text-center text-muted py-4">
                                <i
                                    class="fas fa-box-open fa-2x mb-2 text-secondary"
                                ></i>

                                <div class="small">
                                    Aún no hay productos agregados
                                </div>
                            </div>
                        </div>

                        <!-- TIPO DE VENTA -->
                        <details class="border-bottom">
                            <summary
                                class="d-flex align-items-center gap-2 p-3 fw-bold small"
                            >
                                <i
                                    class="fas fa-file-invoice-dollar text-primary"
                                ></i>

                                <span class="flex-grow-1"> Tipo de venta </span>

                                <i
                                    class="fas fa-chevron-down text-muted details-arrow"
                                ></i>
                            </summary>

                            <div class="px-3 pb-3">
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

                                            <small class="text-muted">
                                                {{
                                                    item.value === "contado"
                                                        ? "Pago inmediato"
                                                        : "Pago pendiente o en cuotas"
                                                }}
                                            </small>
                                        </div>
                                    </div>
                                </el-radio-group>
                            </div>
                        </details>

                        <!-- DESCUENTO -->
                        <details class="border-bottom">
                            <summary
                                class="d-flex align-items-center gap-2 p-3 fw-bold small"
                            >
                                <i class="fas fa-tag text-discount"></i>

                                <span class="flex-grow-1"> Descuento </span>

                                <span class="badge discount-badge">
                                    Bs.
                                    {{ Number(form.descuento || 0).toFixed(2) }}
                                </span>

                                <i
                                    class="fas fa-chevron-down text-muted details-arrow"
                                ></i>
                            </summary>

                            <div class="px-3 pb-3">
                                <label
                                    for="descuento"
                                    class="form-label small fw-bold"
                                >
                                    Aplicar descuento
                                </label>

                                <div class="input-group">
                                    <span class="input-group-text"> Bs. </span>

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

                                <small class="text-muted d-block mt-1">
                                    El descuento se aplicará al salir del campo.
                                </small>
                            </div>
                        </details>

                        <!-- MÉTODOS DE PAGO -->
                        <details class="border-bottom">
                            <summary
                                class="d-flex align-items-center gap-2 p-3 fw-bold small"
                            >
                                <i class="fas fa-credit-card text-primary"></i>

                                <span class="flex-grow-1">
                                    Métodos de pago
                                </span>

                                <span
                                    class="badge bg-primary-subtle text-primary"
                                >
                                    {{
                                        metodo_pagos.filter(
                                            (item) => item.seleccionado,
                                        ).length
                                    }}
                                </span>

                                <i
                                    class="fas fa-chevron-down text-muted details-arrow"
                                ></i>
                            </summary>

                            <div class="px-3 pb-3">
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
                                        <el-checkbox
                                            v-model="metodo_pago.seleccionado"
                                            @click.stop
                                        />

                                        <div class="payment-icon">
                                            <i :class="metodo_pago.icon"></i>
                                        </div>

                                        <div class="flex-grow-1 min-width-0">
                                            <div class="fw-bold small">
                                                {{ metodo_pago.nombre }}
                                            </div>

                                            <small
                                                class="text-muted text-truncate d-block"
                                            >
                                                {{ metodo_pago.descripcion }}
                                            </small>
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
                                            <template #prepend> Bs. </template>
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
                                <span class="text-muted">
                                    <i class="fas fa-calculator me-2"></i>
                                    Subtotal
                                </span>

                                <strong>
                                    Bs.
                                    {{ subTotalVenta.toFixed(2) }}
                                </strong>
                            </div>

                            <div
                                class="d-flex justify-content-between mb-2 small"
                            >
                                <span class="text-muted">
                                    <i class="fas fa-tag me-2"></i>
                                    Descuento
                                </span>

                                <strong class="text-discount">
                                    Bs.
                                    {{ Number(form.descuento || 0).toFixed(2) }}
                                </strong>
                            </div>

                            <hr />

                            <div
                                class="d-flex justify-content-between align-items-center"
                            >
                                <span class="fw-bold text-total">
                                    <i class="fas fa-shopping-cart me-2"></i>
                                    Total
                                </span>

                                <strong class="fs-4 text-total">
                                    Bs. {{ totalVenta.toFixed(2) }}
                                </strong>
                            </div>

                            <div
                                class="d-flex justify-content-between mt-2 small"
                            >
                                <span class="text-balance">
                                    <i class="fas fa-wallet me-2"></i>
                                    Saldo pendiente
                                </span>

                                <strong class="text-balance">
                                    Bs. {{ saldoVenta.toFixed(2) }}
                                </strong>
                            </div>
                        </div>

                        <!-- BOTONES -->
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

<style scoped>
/* =====================================================
   VARIABLES
   Se asume que variables.css ya está cargado globalmente.
===================================================== */

.product-hover {
    border-left: 3px solid transparent !important;
    transition:
        background-color 0.15s ease,
        border-left-color 0.15s ease;
}

.product-hover:hover {
    border-left-color: var(--bgBlue) !important;
    background-color: var(--bg6) !important;
}

.product-hover:last-child {
    border-bottom: 0 !important;
}
.product-quantity {
    width: 75px;
}

.sale-summary-card {
    position: sticky;
    top: 1rem;
}

.sale-header {
    background: linear-gradient(135deg, var(--bgSuccess), #20a77b);
}

.sale-header-icon {
    width: 42px;
    height: 42px;
    color: var(--bgWhite);
    background-color: rgba(255, 255, 255, 0.18);
}

.sale-type-option,
.payment-option {
    cursor: pointer;
    transition:
        border-color 0.15s ease,
        background-color 0.15s ease;
}

.sale-type-option:hover,
.payment-option:hover {
    border-color: var(--bgBlueLight) !important;
    background-color: var(--bgPrimary2);
}

.sale-type-selected,
.payment-selected {
    border-color: var(--bgBlue) !important;
    background-color: var(--bgPrimary2);
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

.subtotal-box {
    border-color: var(--bgSubtotalLight) !important;
    color: var(--bgSubtotal) !important;
    background-color: var(--bgSubtotalLight) !important;
}

.discount-badge {
    color: var(--bgDescuento) !important;
    background-color: var(--bgDescuentoLight) !important;
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

details > summary {
    cursor: pointer;
    list-style: none;
}

details > summary::-webkit-details-marker {
    display: none;
}

.details-arrow {
    transition: transform 0.2s ease;
}

details[open] .details-arrow {
    transform: rotate(180deg);
}

.el-select {
    width: 100%;
}

.el-select .el-input__wrapper,
.el-input .el-input__wrapper {
    box-shadow: none !important;
}

.min-width-0 {
    min-width: 0;
}

@media (max-width: 575.98px) {
    .card-header h5 {
        font-size: 1rem;
    }

    .card-header small {
        font-size: 0.72rem;
    }
}
@media (max-width: 1199.98px) {
    .sale-summary-card {
        position: static;
    }
}

@media (max-width: 767.98px) {
    .product-quantity {
        width: 100%;
    }

    .sale-header-icon {
        width: 36px;
        height: 36px;
    }
}
</style>
