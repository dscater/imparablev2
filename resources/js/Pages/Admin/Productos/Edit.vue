<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useProductos } from "@/composables/productos/useProductos";
import { ref, onBeforeMount } from "vue";
import { useAppStore } from "@/stores/aplicacion/appStore";
import Formulario from "./Formulario.vue";
const props = defineProps({
    producto: {
        type: Object,
        required: true,
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
const { props: props_page } = usePage();
const appStore = useAppStore();
const { setProducto, limpiarProducto, form } = useProductos();
onBeforeMount(() => {
    setProducto(props.producto);
});
</script>
<template>
    <Head title="Editar Producto o Servicio"></Head>
    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-clipboard-list text-success"></i>
                        Editar Producto o Servicio
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
                            Editar Producto o Servicio
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
