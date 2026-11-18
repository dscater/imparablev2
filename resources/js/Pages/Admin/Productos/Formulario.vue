<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, onMounted, nextTick } from "vue";
import { ElPopover } from "element-plus";
import "element-plus/es/components/popover/style/css";

const props = defineProps({
    muestra_formulario: {
        type: Boolean,
        default: false,
    },
    form: {
        type: Object,
    },
    tipo_productos: {
        type: Array,
        default: () => [],
    },
    lista_horarios: {
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
    unidad_medidas: {
        type: Array,
        default: () => [],
    },
});

const muestra_form = ref(props.muestra_formulario);
const enviando = ref(false);
const form = props.form;
const imagen = ref(null);
function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];
}

const tituloDialog = computed(() => {
    return form.id == 0
        ? `<i class="fa fa-plus"></i> Nuevo Producto`
        : `<i class="fa fa-edit"></i> Editar Producto`;
});

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando datos...`;
    }
    if (form.id == 0) {
        return `<i class="fa fa-save"></i> Guardar registro`;
    }
    return `<i class="fa fa-edit"></i> Actualizar registro`;
});

const enviarFormulario = () => {
    enviando.value = true;
    let url =
        form.id == 0
            ? route("productos.store")
            : route("productos.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: (response) => {
            console.log("correcto");
            const success =
                response.props.flash.success ?? "Proceso realizado con éxito";
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>${success}</strong>`,
                confirmButtonText: `Aceptar`,
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });

            document
                .getElementsByTagName("body")[0]
                .classList.remove("modal-open");
            emits("envio-formulario");
        },
        onError: (err, code) => {
            console.log(code ?? "");
            console.log(form.errors);
            if (form.errors) {
                const error =
                    "Existen errores en el formulario, por favor verifique";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            } else {
                const error =
                    "Ocurrió un error inesperado contactese con el Administrador";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            }
            console.log("error: " + err.error);
        },
        onFinish: () => {
            enviando.value = false;
        },
    });
};

const emits = defineEmits(["cerrar-formulario", "envio-formulario"]);

watch(muestra_form, (newVal) => {
    if (!newVal) {
        emits("cerrar-formulario");
    }
});

const cerrarFormulario = () => {
    muestra_form.value = false;
    document.getElementsByTagName("body")[0].classList.remove("modal-open");
};

const tipoSeleccionado = computed(() =>
    props.tipo_productos.find((item) => item.value === form.tipo),
);

onMounted(() => {
    imagen.value.value = null;
});
</script>

<template>
    <form @submit.prevent="enviarFormulario()">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h4 class="card-title">
                                    <i class="fa fa-list"></i> Información del
                                    Producto o Servicio
                                </h4>
                            </div>
                            <div class="col-md-6 mt-2">
                                <label class="required">Código</label>
                                <el-input
                                    type="text"
                                    :class="{
                                        'parsley-error': form.errors?.codigo,
                                    }"
                                    v-model="form.codigo"
                                    autosize
                                ></el-input>
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
                                <label class="required">Nombre</label>
                                <el-input
                                    type="text"
                                    :class="{
                                        'parsley-error': form.errors?.nombre,
                                    }"
                                    v-model="form.nombre"
                                    autosize
                                ></el-input>
                                <ul
                                    v-if="form.errors?.nombre"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.nombre }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-12 mt-2">
                                <label class="required"
                                    >Tipo
                                    <el-popover :width="300" trigger="click">
                                        <template #reference>
                                            <i
                                                class="fa fa-info-circle cursor-pointer text-primary fs-6"
                                            ></i>
                                        </template>
                                        <template #default>
                                            <div
                                                class="demo-rich-conent"
                                                style="
                                                    display: flex;
                                                    gap: 16px;
                                                    flex-direction: column;
                                                "
                                            >
                                                Tipo de Servicio o Producto
                                                <div
                                                    v-for="item in tipo_productos"
                                                >
                                                    <p
                                                        class="demo-rich-content__name"
                                                        style="
                                                            margin: 0;
                                                            font-weight: 500;
                                                        "
                                                    >
                                                        <i
                                                            :class="item.icon"
                                                        ></i>
                                                        {{ item.label }}
                                                    </p>
                                                    <p
                                                        class="demo-rich-content__mention"
                                                        style="
                                                            margin: 0;
                                                            font-size: 14px;
                                                            color: var(
                                                                --el-color-info
                                                            );
                                                        "
                                                        v-text="item.detail"
                                                    ></p>
                                                </div>
                                            </div>
                                        </template>
                                    </el-popover>
                                </label>
                                <el-select
                                    type="text"
                                    :class="{
                                        'parsley-error': form.errors?.tipo,
                                    }"
                                    v-model="form.tipo"
                                    placeholder="- Seleccione -"
                                >
                                    <template #label="{ label, value }">
                                        <span
                                            ><i
                                                :class="tipoSeleccionado.icon"
                                            ></i>
                                            {{ tipoSeleccionado.label }}</span
                                        >
                                    </template>
                                    <el-option
                                        v-for="item in tipo_productos"
                                        :key="item.value"
                                        :value="item.value"
                                        :label="item.label"
                                    >
                                        <span style="float: left">
                                            <i
                                                :class="item.icon"
                                                style="
                                                    color: var(
                                                        --el-text-color-secondary
                                                    );
                                                    font-size: 13px;
                                                "
                                            ></i>
                                            {{ item.label }}</span
                                        >
                                    </el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.tipo"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.tipo }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-12 mt-2">
                                <label>Caracteristicas</label>
                                <el-input
                                    type="textarea"
                                    v-model="form.caracteristicas"
                                    autosize
                                ></el-input>
                                <ul
                                    v-if="form.errors?.caracteristicas"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.caracteristicas }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-12 mt-2">
                                <label class="required">Estado</label>
                                <br />
                                <small class="text-muted text-xs"
                                    >(Podrá realizar ventas y movimientos con
                                    este producto)</small
                                >
                                <br />
                                <el-switch
                                    size="large"
                                    active-text="ACTIVO"
                                    inactive-text="INACTIVO"
                                    v-model="form.activo"
                                    :active-value="1"
                                    :inactive-value="0"
                                    style="
                                        --el-switch-on-color: #13ce66;
                                        --el-switch-off-color: #ff4949;
                                    "
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h4 class="card-title">
                                    <i class="fa fa-clipboard-check"></i>
                                    Detalles del Producto o Servicio
                                </h4>
                            </div>

                            <div class="col-md-12 mt-2">
                                <label class="">Imagen</label>
                                <img
                                    :src="form.url_imagen"
                                    class="d-block rounded border"
                                    style="max-width: 250px"
                                    v-if="form.id != 0"
                                />
                                <input
                                    type="file"
                                    class="form-control"
                                    :class="{
                                        'parsley-error': form.errors?.imagen,
                                    }"
                                    @change="cargaArchivo($event, 'imagen')"
                                    ref="imagen"
                                />
                                <ul
                                    v-if="form.errors?.imagen"
                                    class="list-unstyled text-danger"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.imagen }}
                                    </li>
                                </ul>
                            </div>
                            <!-- PLAN -->
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PLAN'"
                            >
                                <label class="required">Duración días</label>
                                <input
                                    type="number"
                                    class="form-control"
                                    v-model="form.duracion_dias"
                                />
                                <ul
                                    v-if="form.errors?.duracion_dias"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.duracion_dias }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PLAN'"
                            >
                                <label class="required">Horario</label>
                                <el-select
                                    v-model="form.horario"
                                    placeholder="- Seleccione -"
                                    filterable
                                >
                                    <el-option
                                        v-for="item in lista_horarios"
                                        :key="item.value"
                                        :value="item.value"
                                        :label="item.label"
                                    ></el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.horario"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.horario }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PLAN'"
                            >
                                <label class="">Hora Inicio</label>
                                <input
                                    type="time"
                                    class="form-control"
                                    v-model="form.hora_ini"
                                />
                                <ul
                                    v-if="form.errors?.hora_ini"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.hora_ini }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PLAN'"
                            >
                                <label class="">Hora Fin</label>
                                <input
                                    type="time"
                                    class="form-control"
                                    v-model="form.hora_fin"
                                />
                                <ul
                                    v-if="form.errors?.hora_fin"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.hora_fin }}
                                    </li>
                                </ul>
                            </div>

                            <div
                                class="col-md-12 mt-2"
                                v-if="form.tipo == 'PLAN'"
                            >
                                <label class=""
                                    >Indefinido
                                    <el-popover :width="300" trigger="click">
                                        <template #reference>
                                            <i
                                                class="fa fa-info-circle cursor-pointer text-primary fs-6"
                                            ></i>
                                        </template>
                                        <template #default>
                                            <div
                                                class="demo-rich-conent"
                                                style="
                                                    display: flex;
                                                    gap: 16px;
                                                    flex-direction: column;
                                                "
                                            >
                                                INDEFINIDO
                                                <div>
                                                    <p
                                                        class="demo-rich-content__name"
                                                        style="
                                                            margin: 0;
                                                            font-weight: 500;
                                                            color: var(
                                                                --bgPrecargado
                                                            );
                                                        "
                                                    >
                                                        <i
                                                            class="fa fa-circle"
                                                        ></i>
                                                        SI
                                                    </p>
                                                    <p
                                                        class="demo-rich-content__mention"
                                                        style="
                                                            margin: 0;
                                                            font-size: 14px;
                                                            color: var(
                                                                --el-color-info
                                                            );
                                                        "
                                                    >
                                                        La duración del PLAN se
                                                        ira descontando con cada
                                                        ingreso diario que
                                                        realice el cliente
                                                        tomando en cuenta los
                                                        días que se coloquen.
                                                    </p>
                                                </div>
                                                <div>
                                                    <p
                                                        class="demo-rich-content__name"
                                                        style="
                                                            margin: 0;
                                                            font-weight: 500;
                                                            color: var(
                                                                --bgNuevo
                                                            );
                                                        "
                                                    >
                                                        <i
                                                            class="fa fa-circle"
                                                        ></i>
                                                        NO
                                                    </p>
                                                    <p
                                                        class="demo-rich-content__mention"
                                                        style="
                                                            margin: 0;
                                                            font-size: 14px;
                                                            color: var(
                                                                --el-color-info
                                                            );
                                                        "
                                                    >
                                                        La duración del PLAN se
                                                        calculará
                                                        automaticamente; por lo
                                                        que se determinará el
                                                        final según la duración
                                                        de días que se coloque.
                                                    </p>
                                                </div>
                                            </div>
                                        </template>
                                    </el-popover></label
                                >
                                <br />
                                <el-switch
                                    size="large"
                                    active-text="SI"
                                    inactive-text="NO"
                                    v-model="form.indefinido"
                                    :active-value="1"
                                    :inactive-value="0"
                                    style="
                                        --el-switch-on-color: #f59e0b;
                                        --el-switch-off-color: #22c55e;
                                    "
                                />
                                <ul
                                    v-if="form.errors?.indefinido"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.indefinido }}
                                    </li>
                                </ul>
                            </div>
                            <!-- PRODUCTO -->
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PRODUCTO'"
                            >
                                <label class="required">Categoría</label>
                                <el-select
                                    v-model="form.categoria_id"
                                    filterable
                                    no-data-text="Sin datos"
                                    no-match-text="Sin datos"
                                    placeholder="- Seleccione -"
                                >
                                    <el-option
                                        v-for="item in categorias"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.categoria_id"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.categoria_id }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PRODUCTO'"
                            >
                                <label class="required">Marca</label>
                                <el-select
                                    v-model="form.marca_id"
                                    filterable
                                    no-data-text="Sin datos"
                                    no-match-text="Sin datos"
                                    placeholder="- Seleccione -"
                                >
                                    <el-option
                                        v-for="item in marcas"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.marca_id"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.marca_id }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PRODUCTO'"
                            >
                                <label class="required">Unidad de Medida</label>
                                <el-select
                                    v-model="form.unidad_medida_id"
                                    filterable
                                    no-data-text="Sin datos"
                                    no-match-text="Sin datos"
                                    placeholder="- Seleccione -"
                                >
                                    <el-option
                                        v-for="item in unidad_medidas"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <ul
                                    v-if="form.errors?.unidad_medida_id"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.unidad_medida_id }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PRODUCTO'"
                            >
                                <label class="required">Stock Mínimo</label>
                                <input
                                    type="number"
                                    min="0"
                                    class="form-control"
                                    v-model="form.stock_min"
                                />
                                <ul
                                    v-if="form.errors?.stock_min"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.stock_min }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-1">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <h4 class="card-title">
                                    <i class="fa fa-tags"></i> Precio de Venta y
                                    Compra
                                </h4>
                            </div>
                            <div class="col-md-6 mt-2">
                                <label class="required"
                                    >Precio de Venta Bs.</label
                                >
                                <input
                                    type="number"
                                    min="0"
                                    class="form-control"
                                    v-model="form.precio"
                                />
                                <ul
                                    v-if="form.errors?.precio"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.precio }}
                                    </li>
                                </ul>
                            </div>
                            <div
                                class="col-md-6 mt-2"
                                v-if="form.tipo == 'PRODUCTO'"
                            >
                                <label class="required"
                                    >Precio de Compra Bs.</label
                                >
                                <input
                                    type="number"
                                    min="0"
                                    class="form-control"
                                    v-model="form.precio_compra"
                                />
                                <ul
                                    v-if="form.errors?.precio_compra"
                                    class="d-block text-danger list-unstyled"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.precio_compra }}
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center">
                <button
                    type="button"
                    style="min-width: 40vw"
                    class="btn btn-primary mt-2"
                    :disabled="enviando"
                    @click.prevent="enviarFormulario"
                    v-html="textBtn"
                ></button>
            </div>
        </div>
    </form>
</template>
