<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useIngresoProductos } from "@/composables/ingreso_productos/useIngresoProductos";
import Formulario from "./Formulario.vue";
import { onMounted, onUnmounted } from "vue";
const { props: props_page } = usePage();

const props = defineProps({
    sucursals: {
        type: Array,
        default: () => [],
    },
    proveedors: {
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
    tipo_ingresos: {
        type: Array,
        default: () => [],
    },
});

const { setIngresoProducto, limpiarIngresoProducto, form } =
    useIngresoProductos();

onMounted(() => {
    document
        .getElementsByTagName("body")[0]
        .classList.add("sidebar-mini", "sidebar-collapse");
});

onUnmounted(() => {
    document
        .getElementsByTagName("body")[0]
        .classList.remove("sidebar-mini", "sidebar-collapse");
});
</script>
<template>
    <Head title="Orden de Compra"></Head>
    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-boxes"></i> Orden de Compra
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">Orden de Compra</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>
        <div class="row">
            <div class="col-md-12">
                <Formulario
                    :form="form"
                    :sucursals="sucursals"
                    :proveedors="proveedors"
                    :tipo_compras="tipo_compras"
                    :metodo_pagos="metodo_pagos"
                    :tipo_ingresos="tipo_ingresos"
                    @envio-formulario="limpiarIngresoProducto"
                ></Formulario>
            </div>
        </div>
    </Content>
</template>
