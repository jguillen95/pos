<?php


namespace App\Http\Controllers\Dashboard;
use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Order;
use App\Models\Salida;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SalidaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $employees=Employee::all();
        return view('salidas.create', compact('employees'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $fecha=Carbon::now()->format('Y-m-d');
        $salidas = Order::create([
            'order_date' => $fecha,
            'order_status' => 'complete',
            'total_products' => 1,
            'sub_total' => $request->cantidad,
            'invoice_no' => $request->tipo_salida,
            'total' => '-'.$request->cantidad,
            'payment_status' => 'Efectivo',
            'pay' => $request->cantidad,
            'due' => $request->motivo,
            'employee_id' => $request->employee,
        ]);

        return view('salidas.create');
    }

    /**
     * Display the specified resource.
     */
    public function show(Salida $salida)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Salida $salida)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Salida $salida)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Salida $salida)
    {
        //
    }
}
