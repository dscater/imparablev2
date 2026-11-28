<script setup>
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
import { watch, ref, computed, onMounted, nextTick } from "vue";
import MiPaginacion from "@/Components/MiPaginacion.vue";
import { ElPopover } from "element-plus";
import "element-plus/es/components/popover/style/css";
import { ElCheckboxGroup } from "element-plus";
import "element-plus/es/components/checkbox-group/style/css";
const props = defineProps({
    form: {
        type: Object,
    },
    sucursals: {
        type: Array,
        default: () => [],
    },
    tipo_compras: {
        type: Array,
        default: () => [],
    },
    metodo_pagos: {
        type: Array,
        default: () => [],
    },
    proveedors: {
        type: Array,
        default: () => [],
    },
    tipo_ingresos: {
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
        return `<i class="fa fa-save"></i> Registrar Orden de Compra`;
    }
    return `<i class="fa fa-edit"></i> Actualizar Orden de Compra`;
});

const enviarFormulario = () => {
    enviando.value = true;
    form.sucursal_id = sucursal_id.value;
    let url =
        form.id == 0
            ? route("ingreso_productos.store")
            : route("ingreso_productos.update", form.id);

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

// const listSucursals = ref([]);
// const listTipoIngresos = ref([]);
const tipo_ingreso_id_default = ref("");
// const listProveedors = ref([]);
// const listCategorias = ref([]);
// const listMarcas = ref([]);
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
            costo: item.precio_compra,
            tipo_ingreso_id: tipo_ingreso_id_default.value,
        }));
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
const agregandoProducto = ref(false);
const agregarProductoCompra = async (item) => {
    const costo = Number(item.costo);
    const cantidad = Number(item.cantidad);
    const tipo_ingreso_id = item.tipo_ingreso_id;

    if (!costo || costo <= 0) {
        toast.error("Debe ingresar un costo valido");
        return;
    }

    if (!cantidad || cantidad <= 0) {
        toast.error("Debe ingresar una cantidad valido");
        return;
    }

    // if (!tipo_ingreso_id || tipo_ingreso_id == "") {
    //     toast.error("Debe seleccionar un tipo de ingreso");
    //     return;
    // }

    try {
        const resp = await axios.get(route("productos.show", item.id));
        const producto = resp.data;
        const subtotal = cantidad * costo;

        const indexExiste = form.ingreso_detalles.findIndex(
            (elem) => elem.producto_id == producto.id,
        );
        // console.log(indexExiste);
        if (indexExiste < 0) {
            // no existe
            form.ingreso_detalles.push({
                id: 0,
                ingreso_producto_id: "",
                tipo_ingreso_id: tipo_ingreso_id,
                producto: producto,
                producto_id: producto.id,
                cantidad: cantidad,
                costo: costo,
                subtotal: subtotal.toFixed(2),
            });
        } else {
            // existe
            const cantidadFila = form.ingreso_detalles[indexExiste].cantidad;
            const nuevaCantidad =
                parseFloat(cantidad) + parseFloat(cantidadFila);
            const subtotal = nuevaCantidad * costo;

            form.ingreso_detalles[indexExiste].cantidad = nuevaCantidad;
            form.ingreso_detalles[indexExiste].subtotal = subtotal.toFixed(2);
        }
        // console.log(item);
        item.cantidad = 1;
        toast.success("Producto Agregado!!!", {
            autoClose: 200,
        });
    } catch (e) {
        console.log(e);
        toast.error(
            "Ocurrió un error al intentar agregar el producto; intente nuevamente",
        );
    }
};

const detectarCambioFila = (item, index) => {
    const cant = Number(item.cantidad);
    const costo = Number(item.costo);
    if (!cant || !costo) {
        return;
    }

    const subtotal = cant * costo;
    form.ingreso_detalles[index].subtotal = subtotal.toFixed(2);
};

const quitarFila = (item, index) => {
    const id = item.id;
    if (id != 0) {
        form.eliminados.push(id);
    }

    form.ingreso_detalles.splice(index, 1);
    toast.success("Se quitó el producto!!!");
};

const totalCompra = computed(() => {
    if (!form?.ingreso_detalles) return 0;
    return form.ingreso_detalles.reduce((acc, item) => {
        return acc + parseFloat(item.subtotal || 0);
    }, 0);
});

const totalCancelado = computed(() => {
    return form.ingreso_metodos.reduce((total, metodo) => {
        return total + (parseFloat(metodo.monto) || 0);
    }, 0);
});
const saldoCompra = computed(() => {
    const cancelado =
        (parseFloat(form.cancelado_efectivo) || 0) +
        (parseFloat(form.cancelado_qr) || 0);
    return (parseFloat(form.total) || 0) - cancelado;
});
watch([totalCompra, totalCancelado, saldoCompra], () => {
    form.total = totalCompra.value.toFixed(2);

    form.cancelado = totalCancelado.value.toFixed(2);

    form.saldo = saldoCompra.value.toFixed(2);
});

const cambiarTipoCompra = () => {
    form.total_cancelado = form.total;
    if (form.tipo_compra == "CRÉDITO") {
        form.total_cancelado = 0;
    }
};

const metodosPagoSeleccionados = computed(() => {
    return form.ingreso_metodos;
});

const totalMontoMetodosPago = computed(() => {
    return metodosPagoSeleccionados.value.reduce((total, metodo) => {
        return total + Number(metodo.monto || 0);
    }, 0);
});

const toggleMetodoPago = (metodoPagoId) => {
    const index = form.ingreso_metodos_ids.indexOf(metodoPagoId);

    if (index === -1) {
        form.ingreso_metodos_ids.push(metodoPagoId);
    } else {
        form.ingreso_metodos_ids.splice(index, 1);
    }
};

const obtenerMontoMetodo = (metodoPagoId) => {
    const metodo = form.ingreso_metodos.find(
        (item) => item.metodo_pago_id === metodoPagoId,
    );

    return metodo?.monto ?? 0;
};

const actualizarMontoMetodo = (metodoPagoId, monto) => {
    const metodo = form.ingreso_metodos.find(
        (item) => item.metodo_pago_id === metodoPagoId,
    );

    if (!metodo) {
        return;
    }

    metodo.monto = Number(monto) || 0;
};

watch([totalCompra, saldoCompra], () => {
    form.total = totalCompra.value.toFixed(2);
    form.saldo = saldoCompra.value.toFixed(2);
});

onMounted(() => {
    cargarListas();
    if (form.id != 0 && form.sucursal_id) {
        sucursal_id.value = form.sucursal_id;
        cargarProductos();
    }
});
</script>

<template>
    <form @submit.prevent="enviarFormulario()">
        <div class="container-fluid py-3 bg-light">
            <div class="row g-3">
                <!-- CATAOGO -->
                <div class="col-12 col-md-7">
                    <div class="card h-100 border-0 shadow-sm">
                        <div
                            class="card-header text-white border-0 px-3 py-3"
                            style="
                                background: linear-gradient(
                                    135deg,
                                    var(--bgInfo),
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
                                                Nueva Orden de Compra
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
                                                Costo Bs.
                                            </div>
                                            <input
                                                type="number"
                                                class="form-control form-control-sm text-center catalog-quantity"
                                                v-model="item.costo"
                                                min="1"
                                            />
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
                                                    agregarProductoCompra(item)
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
                <div class="col-md-5">
                    <div class="card border-0 shadow-sm">
                        <div
                            class="card-header text-white border-0 px-3 py-3"
                            style="
                                background: linear-gradient(
                                    135deg,
                                    var(--bgInfo),
                                    var(--bg2)
                                );
                            "
                        >
                            <div class="row">
                                <div class="col-12">
                                    <h4 class="card-title text-white pt-1">
                                        <i class="fa fa-clipboard-check"></i>
                                        Datos de la compra
                                    </h4>
                                    <div
                                        class="float-end badge bg-success rounded-circle fs-6"
                                    >
                                        {{ form.ingreso_detalles.length }}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label class="required"
                                        >Código de Ingreso</label
                                    >
                                    <input
                                        v-model="form.codigo"
                                        placeholder="Código de Ingreso"
                                        class="form-control"
                                    />
                                    <ul
                                        v-if="form.errors?.codigo"
                                        class="d-block text-danger list-unstyled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.codigo }}
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label class="required">Proveedor</label>
                                    <el-select
                                        v-model="form.proveedor_id"
                                        no-data-text="Sin datos"
                                        no-match-text="Sin resultados"
                                        placeholder="Proveedor"
                                        filterable
                                    >
                                        <el-option
                                            v-for="item in proveedors"
                                            :key="item.id"
                                            :value="item.id"
                                            :label="item.nombre"
                                        ></el-option>
                                    </el-select>
                                    <ul
                                        v-if="form.errors?.proveedor_id"
                                        class="d-block text-danger list-unstyled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.proveedor_id }}
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <label class="required"
                                        >Tipo de Ingreso</label
                                    >
                                    <el-select
                                        placeholder="Tipo de Ingreso"
                                        no-data-text="Sin datos"
                                        no-match-text="Sin resultados"
                                        filterable
                                        v-model="form.tipo_ingreso_id"
                                    >
                                        <el-option
                                            v-for="item in tipo_ingresos"
                                            :key="item.id"
                                            :value="item.id"
                                            :label="item.nombre"
                                        ></el-option>
                                    </el-select>
                                    <ul
                                        v-if="form.errors?.proveedor_id"
                                        class="d-block text-danger list-unstyled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.proveedor_id }}
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-12 mt-2">
                                    <label class="">Descripción</label>
                                    <el-input
                                        type="text"
                                        :class="{
                                            'parsley-error':
                                                form.errors?.descripcion,
                                        }"
                                        v-model="form.descripcion"
                                        autosize
                                    ></el-input>
                                    <ul
                                        v-if="form.errors?.descripcion"
                                        class="d-block text-danger list-unstyled"
                                    >
                                        <li class="parsley-required">
                                            {{ form.errors?.descripcion }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div
                                class="concept-list"
                                v-if="form.ingreso_detalles.length > 0"
                            >
                                <div
                                    class="list-group-item px-3 py-3 concept-row concept-row-product"
                                    v-for="(
                                        item, index
                                    ) in form.ingreso_detalles"
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
                                                >Costo Bs.</label
                                            >
                                            <input
                                                type="number"
                                                min="0"
                                                step="0.01"
                                                class="form-control text-end"
                                                v-model.number="item.costo"
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
                                                        item.subtotal || 0,
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
                                </div>
                            </div>
                            <div v-else class="text-center text-muted py-4">
                                <i
                                    class="fas fa-shopping-basket fa-2x mb-2 text-secondary"
                                ></i>
                                <div class="small">
                                    Aún no hay productos agregados
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
                                        >Tipo de compra</strong
                                    ><small
                                        >Define cómo se registrará la
                                        compra</small
                                    ></span
                                >
                                <span class="badge section-summary-value">
                                    {{
                                        tipo_compras.find(
                                            (item) =>
                                                item.value === form.tipo_compra,
                                        )?.label || "Sin seleccionar"
                                    }}
                                </span>
                                <i
                                    class="fas fa-chevron-down section-arrow"
                                ></i>
                            </summary>
                            <div class="px-3 py-3">
                                <el-radio-group
                                    v-model="form.tipo_compra"
                                    class="row g-2 w-100"
                                    @change="cambiarTipoCompra"
                                >
                                    <div
                                        v-for="item in tipo_compras"
                                        :key="item.value"
                                        class="col-12 col-sm-6"
                                    >
                                        <div
                                            class="border rounded p-2 h-100 sale-type-option cursor-pointer"
                                            :class="{
                                                'sale-type-selected':
                                                    form.tipo_compra ===
                                                    item.value,
                                            }"
                                            @click="
                                                form.tipo_compra = item.value
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
                                                        form.tipo_compra ===
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

                        <!-- MÉTODOS DE PAGO -->
                        <details class="section-details">
                            <summary
                                class="section-summary section-summary-success"
                            >
                                <span class="section-summary-icon">
                                    <i class="fas fa-credit-card"></i>
                                </span>

                                <span class="flex-grow-1">
                                    <strong class="d-block">
                                        Métodos de pago
                                    </strong>

                                    <small>
                                        Selecciona cómo se realizará el pago
                                    </small>
                                </span>

                                <!-- RESUMEN DE MÉTODOS Y MONTO PAGADO -->
                                <el-popover
                                    placement="top"
                                    width="280"
                                    trigger="hover"
                                >
                                    <div class="payment-popover">
                                        <div class="fw-bold small mb-2">
                                            Métodos asignados
                                        </div>

                                        <div
                                            v-if="
                                                metodosPagoSeleccionados.length ===
                                                0
                                            "
                                            class="text-muted small"
                                        >
                                            No hay métodos seleccionados.
                                        </div>

                                        <div v-else>
                                            <div
                                                v-for="metodo in metodosPagoSeleccionados"
                                                :key="metodo.metodo_pago_id"
                                                class="payment-popover-item"
                                            >
                                                <span class="text-truncate">
                                                    {{ metodo.nombre }}
                                                </span>

                                                <strong>
                                                    Bs.
                                                    {{
                                                        Number(
                                                            metodo.monto || 0,
                                                        ).toFixed(2)
                                                    }}
                                                </strong>
                                            </div>

                                            <div class="payment-popover-total">
                                                <span>Total pagado</span>

                                                <strong>
                                                    Bs.
                                                    {{
                                                        totalMontoMetodosPago.toFixed(
                                                            2,
                                                        )
                                                    }}
                                                </strong>
                                            </div>

                                            <div
                                                v-if="saldoCompra > 0"
                                                class="payment-popover-balance"
                                            >
                                                <span>Saldo restante</span>

                                                <strong>
                                                    Bs.
                                                    {{ saldoCompra.toFixed(2) }}
                                                </strong>
                                            </div>
                                        </div>
                                    </div>

                                    <template #reference>
                                        <span
                                            class="badge section-summary-value payment-summary-badge"
                                        >
                                            {{
                                                metodosPagoSeleccionados.length
                                            }}
                                        </span>
                                    </template>
                                </el-popover>

                                <i
                                    class="fas fa-chevron-down section-arrow"
                                ></i>
                            </summary>

                            <div class="px-3 py-3">
                                <el-checkbox-group
                                    v-model="form.ingreso_metodos_ids"
                                    class="w-100"
                                >
                                    <div
                                        v-for="metodo_pago in metodo_pagos"
                                        :key="metodo_pago.id"
                                        class="border rounded p-2 mb-2 payment-option"
                                        :class="{
                                            'payment-selected':
                                                form.ingreso_metodos_ids.includes(
                                                    metodo_pago.id,
                                                ),
                                        }"
                                        :aria-pressed="
                                            form.ingreso_metodos_ids.includes(
                                                metodo_pago.id,
                                            )
                                        "
                                        @click="
                                            toggleMetodoPago(metodo_pago.id)
                                        "
                                    >
                                        <div
                                            class="d-flex align-items-center gap-2"
                                        >
                                            <div class="payment-icon">
                                                <i
                                                    :class="metodo_pago.icon"
                                                ></i>
                                            </div>

                                            <div
                                                class="flex-grow-1 min-width-0"
                                            >
                                                <div class="fw-bold small">
                                                    {{ metodo_pago.nombre }}
                                                </div>

                                                <small
                                                    class="text-muted text-truncate d-block"
                                                >
                                                    {{
                                                        metodo_pago.descripcion
                                                    }}
                                                </small>
                                            </div>

                                            <!-- Checkbox vinculado al grupo,
                         pero oculto visualmente -->
                                            <el-checkbox
                                                class="payment-checkbox-hidden"
                                                :value="metodo_pago.id"
                                                @click.stop
                                            />

                                            <i
                                                v-if="
                                                    form.ingreso_metodos_ids.includes(
                                                        metodo_pago.id,
                                                    )
                                                "
                                                class="fas fa-check-circle payment-check-icon"
                                            ></i>
                                        </div>

                                        <!-- MONTO DEL MÉTODO -->
                                        <div
                                            v-if="
                                                form.ingreso_metodos_ids.includes(
                                                    metodo_pago.id,
                                                )
                                            "
                                            class="mt-2"
                                            @click.stop
                                        >
                                            <el-input
                                                type="number"
                                                min="0"
                                                step="0.01"
                                                placeholder="Monto pagado"
                                                :model-value="
                                                    obtenerMontoMetodo(
                                                        metodo_pago.id,
                                                    )
                                                "
                                                @update:model-value="
                                                    actualizarMontoMetodo(
                                                        metodo_pago.id,
                                                        $event,
                                                    )
                                                "
                                            >
                                                <template #prepend>
                                                    Bs.
                                                </template>
                                            </el-input>
                                        </div>
                                    </div>
                                </el-checkbox-group>
                            </div>
                        </details>

                        <!-- TOTALES -->
                        <div class="p-3 bg-light">
                            <div
                                class="d-flex justify-content-between align-items-center"
                            >
                                <span class="fw-bold text-total"
                                    ><i class="fas fa-shopping-cart me-2"></i
                                    >Total</span
                                >
                                <strong class="fs-4 text-total"
                                    >Bs. {{ totalCompra.toFixed(2) }}</strong
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
                                    >Bs. {{ saldoCompra.toFixed(2) }}</strong
                                >
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-12">
                                    <button
                                        type="button"
                                        class="btn btn-primary btn-sm w-100"
                                        :disabled="enviando"
                                        @click.prevent="enviarFormulario"
                                        v-html="textBtn"
                                    ></button>
                                    <!-- <button
                                    type="button"
                                    class="btn btn-default btn-sm w-100 mt-2 border"
                                >
                                    <i class="fa fa-times"></i> Cancelar Compra
                                </button> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</template>
<style scoped src="@/assets/css/venta.css"></style>
