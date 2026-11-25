<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useVentas } from "@/composables/ventas/useVentas";
import { onMounted, onUnmounted, ref } from "vue";
import Formulario from "./Formulario.vue";
const { props: props_page } = usePage();
const props = defineProps({
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

const { setVenta, limpiarVenta, form } = useVentas();
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
    <Head title="Nueva Venta"></Head>
    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0 text-success">
                        <i class="fa fa-money-check-alt"></i> Nueva Venta
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">Nueva Venta</li>
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
                    :categorias="categorias"
                    :marcas="marcas"
                    :tipo_ventas="tipo_ventas"
                    :metodo_pagos="metodo_pagos"
                    :tipo_productos="tipo_productos"
                    @envio-formulario="limpiarVenta"
                ></Formulario>
            </div>
        </div>
    </Content>
</template>
