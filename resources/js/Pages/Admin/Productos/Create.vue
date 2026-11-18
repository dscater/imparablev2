<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useProductos } from "@/composables/productos/useProductos";
import { ref } from "vue";
import Formulario from "./Formulario.vue";
const { props: props_page } = usePage();
const props = defineProps({
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

const { setProducto, limpiarProducto, form } = useProductos();
</script>
<template>
    <Head title="Nuevo Producto o Servicio"></Head>
    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0 text-success">
                        <i class="fa fa-clipboard-list"></i> Nuevo Producto o
                        Servicio
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item">
                            <Link :href="route('productos.index')"
                                >Lista de Productos</Link
                            >
                        </li>
                        <li class="breadcrumb-item active">
                            Nuevo Producto o Servicio
                        </li>
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
                    :tipo_productos="tipo_productos"
                    :lista_horarios="lista_horarios"
                    :categorias="categorias"
                    :marcas="marcas"
                    :unidad_medidas="unidad_medidas"
                    @envio-formulario="limpiarProducto"
                ></Formulario>
            </div>
        </div>
    </Content>
</template>
