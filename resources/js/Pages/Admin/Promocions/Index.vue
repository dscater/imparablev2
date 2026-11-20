<script setup>
import Content from "@/Components/Content.vue";
import MiTableSkeleton from "@/Components/MiTableSkeleton.vue";
import MiTable from "@/Components/MiTable.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { usePromocions } from "@/composables/promocions/usePromocions";
import { useAxios } from "@/composables/axios/useAxios";
import { ref } from "vue";
import Formulario from "./Formulario.vue";
const { props: props_page } = usePage();
const { setPromocion, limpiarPromocion, form } = usePromocions();
const { axiosDelete } = useAxios();

const miTable = ref(null);
const headers = [
    {
        label: "NRO.",
        key: "id",
        sortable: true,
        width: "4%",
    },
    {
        label: "NOMBRE",
        key: "nombre",
        sortable: true,
    },
    {
        label: "DESCRIPCIÓN",
        key: "descripcion",
        sortable: true,
    },
    {
        label: "TIPO",
        key: "tipo",
        sortable: true,
    },
    {
        label: "INDEFINIDO",
        key: "indefinido",
        sortable: true,
    },
    {
        label: "FECHA INICIO",
        key: "fecha_ini",
        sortable: true,
    },
    {
        label: "FECHA FINALIZACIÓN",
        key: "fecha_fin",
        sortable: true,
    },
    {
        label: "VALOR DEL DESCUENTO",
        key: "porcentaje_monto",
        sortable: true,
    },
    {
        label: "ESTADO",
        key: "estado",
        sortable: true,
    },
    {
        label: "ACCIÓN",
        key: "accion",
        fixed: "right",
        width: "4%",
    },
];

const multiSearch = ref({
    search: "",
    filtro: [],
});

const muestra_formulario = ref(false);

const agregarRegistro = () => {
    limpiarPromocion();
    muestra_formulario.value = true;
};

const updateDatatable = async () => {
    if (miTable.value) {
        await miTable.value.cargarDatos();
        limpiarPromocion();
        muestra_formulario.value = false;
    }
};

const eliminarPromocion = (item) => {
    Swal.fire({
        title: "¿Quierés eliminar este registro?",
        html: `<strong>${item.nombre}</strong>`,
        showCancelButton: true,
        confirmButtonText: "Si, eliminar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
        customClass: {
            confirmButton: "btn-danger",
        },
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            let respuesta = await axiosDelete(
                route("promocions.destroy", item.id),
            );
            if (respuesta && respuesta.sw) {
                updateDatatable();
            }
        }
    });
};

const tablaLista = ref(false);
const tablaError = ref(false);

function tablaPreparada() {
    tablaLista.value = true;
    tablaError.value = false;
}

function tablaConError() {
    tablaError.value = true;
}
</script>
<template>
    <Head title="Promociones y Descuentos"></Head>
    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-tags"></i> Promociones y Descuentos
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">
                            Promociones y Descuentos
                        </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <button
                            v-if="
                                props_page.auth?.user.permisos == '*' ||
                                props_page.auth?.user.permisos.includes(
                                    'promocions.create',
                                )
                            "
                            type="button"
                            class="btn btn-primary text-sm"
                            @click="agregarRegistro"
                        >
                            <i class="fa fa-plus"></i> Nueva Promoción o
                            Descuento
                        </button>
                    </div>
                    <div class="col-md-8 my-1">
                        <div class="row justify-content-end">
                            <div class="col-md-5">
                                <div class="input-group">
                                    <input
                                        type="search"
                                        v-model="multiSearch.search"
                                        placeholder="Buscar"
                                        class="form-control border-1 border-right-0"
                                    />
                                    <div class="input-append">
                                        <button
                                            class="btn btn-default bg-white rounded-0"
                                            @click="updateDatos"
                                        >
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div
                            v-if="!tablaLista && !tablaError"
                            class="table-loading-overlay"
                        >
                            <MiTableSkeleton
                                theme="light"
                                responsive
                                responsive-breakpoint="900px"
                                :rows="8"
                                :columns="headers.length || 5"
                                :show-toolbar="true"
                                :show-pagination="true"
                            />
                        </div>

                        <div v-if="tablaError" class="table-error-message">
                            No se pudieron cargar los registros.
                        </div>
                        <MiTable
                            v-show="tablaLista"
                            :tableClass="'bg-white mitabla'"
                            ref="miTable"
                            :cols="headers"
                            :api="true"
                            :url="route('promocions.paginado')"
                            :numPages="5"
                            :multiSearch="multiSearch"
                            :syncOrderBy="'id'"
                            :syncOrderAsc="'DESC'"
                            table-responsive
                            :header-class="'bg__primary'"
                            fixed-header
                            @ready="tablaPreparada"
                            @load-error="tablaConError"
                        >
                            <template #porcentaje_monto="{ item }">
                                <div>
                                    <span
                                        v-if="
                                            item.porcentaje_monto ==
                                            'PORCENTAJE'
                                        "
                                        ><i class="fa fa-percent"></i>
                                        {{ item.porcentaje }}</span
                                    >
                                    <span v-else class="fw-bold"
                                        >Bs. {{ item.monto }}</span
                                    >
                                </div>
                            </template>
                            <template #indefinido="{ item }">
                                <span
                                    class="badge text-xs"
                                    :class="[
                                        item.indefinido == 1
                                            ? 'bgPrecargado'
                                            : 'bgNuevo',
                                    ]"
                                    >{{
                                        item.indefinido == 1 ? "SI" : "NO"
                                    }}</span
                                >
                            </template>
                            <template #estado="{ item }">
                                <span
                                    class="badge text-xs"
                                    :class="[
                                        item.estado == 1
                                            ? 'bgActivo'
                                            : 'bgInactivo',
                                    ]"
                                    >{{
                                        item.estado == 1 ? "ACTIVO" : "INACTIVO"
                                    }}</span
                                >
                            </template>
                            <template #accion="{ item }">
                                <template
                                    v-if="
                                        props_page.auth?.user.permisos == '*' ||
                                        props_page.auth?.user.permisos.includes(
                                            'promocions.edit',
                                        )
                                    "
                                >
                                    <el-tooltip
                                        class="box-item"
                                        effect="dark"
                                        content="Editar"
                                        placement="left-start"
                                    >
                                        <button
                                            class="btn btn-warning"
                                            @click="
                                                setPromocion(item);
                                                muestra_formulario = true;
                                            "
                                        >
                                            <i class="fa fa-pen"></i></button
                                    ></el-tooltip>
                                </template>

                                <template
                                    v-if="
                                        props_page.auth?.user.permisos == '*' ||
                                        props_page.auth?.user.permisos.includes(
                                            'promocions.destroy',
                                        )
                                    "
                                >
                                    <el-tooltip
                                        class="box-item"
                                        effect="dark"
                                        content="Eliminar"
                                        placement="left-start"
                                    >
                                        <button
                                            class="btn btn-danger"
                                            @click="eliminarPromocion(item)"
                                        >
                                            <i
                                                class="fa fa-trash-alt"
                                            ></i></button
                                    ></el-tooltip>
                                </template>
                            </template>
                        </MiTable>
                    </div>
                </div>
            </div>
        </div>
        <Formulario
            v-if="muestra_formulario"
            :muestra_formulario="muestra_formulario"
            :form="form"
            @envio-formulario="updateDatatable"
            @cerrar-formulario="muestra_formulario = false"
        ></Formulario>
    </Content>
</template>
