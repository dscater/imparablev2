import { useForm } from "@inertiajs/vue3";

export const useSucursals = () => {
    const initialState = {
        id: 0,
        nombre: "",
        fono: "",
        dir: "",
        activo: 1,
        fecha_registro: "",
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setSucursal = (item) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarSucursal = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    return {
        form,
        setSucursal,
        limpiarSucursal,
    };
};
