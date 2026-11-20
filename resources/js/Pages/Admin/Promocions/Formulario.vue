<script setup>
import MiModal from "@/Components/MiModal.vue";
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
});

const muestra_form = ref(props.muestra_formulario);
const enviando = ref(false);
const form = props.form;

const tituloDialog = computed(() => {
    return form.id == 0
        ? `<i class="fa fa-plus"></i> Nueva Promoción o Descuento`
        : `<i class="fa fa-edit"></i> Editar Promoción o Descuento`;
});

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    if (form.id == 0) {
        return `<i class="fa fa-save"></i> Guardar`;
    }
    return `<i class="fa fa-edit"></i> Actualizar`;
});

const enviarFormulario = () => {
    enviando.value = true;
    let url =
        form.id == 0
            ? route("promocions.store")
            : route("promocions.update", form.id);

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

const listTipoProductos = ref([
    {
        value: "TODOS",
        label: "TODOS",
        icon: "fa fa-check-double",
        detail: "Se aplicará a todos los PRODUCTOS/SERVICIOS/PLANES que cumplan la cantidad (si se indica)",
    },
]);
const cargarTipoProductos = () => {
    axios.get(route("tipo_productos.listado")).then((response) => {
        listTipoProductos.value = [
            ...listTipoProductos.value,
            ...response.data.tipo_productos,
        ];
    });
};

const tipoSeleccionado = computed(() =>
    listTipoProductos.value.find((item) => item.value === form.tipo),
);

const labelFiltro = computed(() => {
    if (form.porcentaje_monto == "PORCENTAJE") {
        return `<i class="fa fa-percent"></i> Porcentaje`;
    }

    return `<i class="fa fa-money-bill"></i> Monto`;
});

onMounted(() => {
    cargarTipoProductos();
});
</script>

<template>
    <MiModal
        :open_modal="muestra_form"
        @close="cerrarFormulario"
        :size="'modal-xl'"
        :header-class="'bg-principal'"
        :footer-class="'justify-content-end'"
    >
        <template #header>
            <h4 class="modal-title text-white" v-html="tituloDialog"></h4>
            <button
                type="button"
                class="btn-close btn-close-white"
                @click.prevent="cerrarFormulario()"
            ></button>
        </template>

        <template #body>
            <form @submit.prevent="enviarFormulario()">
                <p class="text-muted text-xs mb-0">
                    Todos los campos con
                    <span class="text-danger">(*)</span> son obligatorios.
                </p>
                <div class="row">
                    <div class="col-md-4 mt-2">
                        <label class="required"
                            >Nombre de Promoción o Descuento</label
                        >
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
                    <div class="col-md-4 mt-2">
                        <label class="required">Descripción</label>
                        <el-input
                            type="textarea"
                            :class="{
                                'parsley-error': form.errors?.descripcion,
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
                    <div class="col-md-4 mt-2">
                        <label class="required"
                            >Servicio/Producto/Plan
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
                                        <div v-for="item in listTipoProductos">
                                            <p
                                                class="demo-rich-content__name"
                                                style="
                                                    margin: 0;
                                                    font-weight: 500;
                                                "
                                            >
                                                <i :class="item.icon"></i>
                                                {{ item.label }}
                                            </p>
                                            <p
                                                class="demo-rich-content__mention"
                                                style="
                                                    margin: 0;
                                                    font-size: 14px;
                                                    color: var(--el-color-info);
                                                "
                                                v-text="item.detail"
                                            ></p>
                                        </div>
                                    </div>
                                </template> </el-popover
                        ></label>
                        <el-select
                            type="text"
                            :class="{
                                'parsley-error': form.errors?.tipo,
                            }"
                            v-model="form.tipo"
                            placeholder="- Seleccione -"
                        >
                            <template #label="{ label, value }">
                                <span v-if="tipoSeleccionado"
                                    ><i :class="tipoSeleccionado.icon"></i>
                                    {{ tipoSeleccionado.label }}</span
                                >
                            </template>
                            <el-option
                                v-for="item in listTipoProductos"
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
                    <div class="col-md-4 mt-2">
                        <label class="required"
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
                                                    color: var(--bgPrecargado);
                                                "
                                            >
                                                <i class="fa fa-circle"></i>
                                                SI
                                            </p>
                                            <p
                                                class="demo-rich-content__mention"
                                                style="
                                                    margin: 0;
                                                    font-size: 14px;
                                                    color: var(--el-color-info);
                                                "
                                            >
                                                La duración de la PROMOCIÓN o
                                                DESCUENTO, no tendrá fecha de
                                                finalización
                                            </p>
                                        </div>
                                        <div>
                                            <p
                                                class="demo-rich-content__name"
                                                style="
                                                    margin: 0;
                                                    font-weight: 500;
                                                    color: var(--bgNuevo);
                                                "
                                            >
                                                <i class="fa fa-circle"></i>
                                                NO
                                            </p>
                                            <p
                                                class="demo-rich-content__mention"
                                                style="
                                                    margin: 0;
                                                    font-size: 14px;
                                                    color: var(--el-color-info);
                                                "
                                            >
                                                La duración de la PROMOCIÓN o
                                                DESCUENTO, debe tener una fecha
                                                de finalización
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
                    <div class="col-md-4 mt-2">
                        <label class="required">Fecha de Inicio</label>
                        <input
                            type="date"
                            class="form-control"
                            v-model="form.fecha_ini"
                        />
                        <ul
                            v-if="form.errors?.fecha_ini"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.fecha_ini }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4 mt-2" v-if="form.indefinido == 0">
                        <label class="required">Fecha de Finalización</label>
                        <input
                            type="date"
                            class="form-control"
                            v-model="form.fecha_fin"
                        />
                        <ul
                            v-if="form.errors?.fecha_fin"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.fecha_fin }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class=""
                            >Cantidad
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
                                        CANTIDAD
                                        <div>
                                            <p
                                                class="demo-rich-content__mention"
                                                style="
                                                    margin: 0;
                                                    font-size: 14px;
                                                    color: var(--el-color-info);
                                                "
                                            >
                                                Indica que cantidad del
                                                PRODUCTO/SERVICIO/PLAN se debe
                                                cumplir para que se aplique la
                                                PROMOCIÓN o DESCUENTO.
                                            </p>
                                            <p
                                                class="demo-rich-content__mention"
                                                style="
                                                    margin: 0;
                                                    font-size: 14px;
                                                    color: var(--el-color-info);
                                                "
                                            >
                                                Dejar vacío si no se necesita
                                                verificar una cantidad para
                                                aplicar la PROMOCIÓN o
                                                DESCUENTO.
                                            </p>
                                        </div>
                                    </div>
                                </template>
                            </el-popover></label
                        >
                        <input type="number" class="form-control" />
                        <ul
                            v-if="form.errors?.indefinido"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.indefinido }}
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4 mt-2">
                        <label class="required">Valor del descuento </label>
                        <div class="input-group">
                            <input
                                v-if="form.porcentaje_monto == 'PORCENTAJE'"
                                type="number"
                                step="0.01"
                                v-model="form.porcentaje"
                                class="form-control text-center"
                            />
                            <input
                                v-if="form.porcentaje_monto == 'MONTO'"
                                type="number"
                                step="0.01"
                                v-model="form.monto"
                                class="form-control text-center"
                            />
                            <div class="form-control border-0 p-0">
                                <el-select
                                    v-model="form.porcentaje_monto"
                                    size="large"
                                    class="el-select-input-group-right"
                                >
                                    <template #label="{ label, value }">
                                        <span
                                            style="font-weight: bold"
                                            v-html="labelFiltro"
                                        ></span>
                                    </template>

                                    <el-option
                                        key="PORCENTAJE"
                                        value="PORCENTAJE"
                                    >
                                        <i class="fa fa-percent"></i>
                                        Porcentaje
                                    </el-option>
                                    <el-option key="MONTO" value="MONTO">
                                        <i class="fa fa-money-bill"></i>
                                        Monto
                                    </el-option>
                                </el-select>
                            </div>
                        </div>
                        <ul
                            v-if="form.errors?.porcentaje"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.porcentaje }}
                            </li>
                        </ul>
                        <ul
                            v-if="form.errors?.monto"
                            class="d-block text-danger list-unstyled"
                        >
                            <li class="parsley-required">
                                {{ form.errors?.monto }}
                            </li>
                        </ul>
                    </div>
                </div>
            </form>
        </template>
        <template #footer>
            <button
                type="button"
                class="btn btn-default"
                @click.prevent="cerrarFormulario()"
            >
                Cerrar
            </button>
            <button
                type="button"
                class="btn btn-primary"
                :disabled="enviando"
                @click.prevent="enviarFormulario"
                v-html="textBtn"
            ></button>
        </template>
    </MiModal>
</template>
