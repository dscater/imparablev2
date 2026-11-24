import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";
import { useDate } from "../useDate";

export const useVentas = () => {
    const initialState = {
        id: 0,
        codigo_venta: "",
        sucursal_id: "",
        cliente_id: "",
        nit_ci: "",
        tipo_venta: "AL CONTADO",
        subtotal: 0,
        descuento: 0,
        porcentaje_descuento: 0,
        total: 0,
        saldo: 0,
        fecha: useDate().getFechaActual(),
        hora: useDate().getHoraActual(),
        fecha_registro: "",
        status: "",
        user_id: "",
        venta_metodos: [],
        venta_metodos_ids: [],
        metodos_eliminados: [],
        venta_detalles: [],
        eliminados: [],
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setVenta = (item = null) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarVenta = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setVenta,
        limpiarVenta,
    };
};
