<?php

namespace App\Http\Controllers\Dashboard;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Employee;
use PHPUnit\TextUI\Configuration\Php;

class DashboardController extends Controller
{
    public function index(){
        $fecha=date("Y-m-d");
        return view('dashboard.index', [
            'total_paid' => Order::sum('pay'),
            'employees' => Employee::all(),
            'total_fecha' => Order::where('order_date', $fecha)
            ->sum('total'),
            'total_due' => Order::sum('due'),
            'complete_orders' => Order::where('order_status', 'complete')->where('order_date', $fecha)->get(),
            'products' => Product::orderBy('category_id')->take(5)->get(),
            'new_products' => Product::orderBy('buying_date')->take(2)->get(),
        ]);
    }

    public function search(Request $request){
       
        $f_inicio=$request->input('fecha_inicio');
        $f_fin=$request->input('fecha_final');
        $employee=$request->input('employee');
        // if($employee='*'){
        //     $resume = Order::whereBetween('order_date', [$f_inicio, $f_fin])
        //     ->sum('pay');
        //     $ventas = Order::select('orders.invoice_no','orders.total','orders.total_products','employees.name')
        //     ->join('employees', 'employees.id', '=', 'orders.employee_id')
        //     ->whereBetween('order_date', [$f_inicio, $f_fin])
        //     ->get();
        // }else{

        $resume = Order::where('employee_id', $employee)
        ->whereBetween('order_date', [$f_inicio, $f_fin])
        ->sum('total');
        $ventas = Order::select('orders.invoice_no','orders.total','orders.total_products','employees.name')
        ->join('employees', 'employees.id', '=', 'orders.employee_id')
        ->where('employee_id',$employee)
        ->whereBetween('order_date', [$f_inicio, $f_fin])
        ->get();
    // }
        return view('dashboard.resume', compact('resume','ventas'));

        // return response($resume);
    }

    public function corte(Request $request){
        $fecha=$request->input('fecha_corte');
            $resume = Order::where('order_date', $fecha)
            ->sum('total');
            $ventas = Order::select('orders.invoice_no','orders.total','orders.total_products','employees.name')
            ->join('employees', 'employees.id', '=', 'orders.employee_id')
            ->where('order_date', $fecha)
            ->get();
            return view('dashboard.resume', compact('resume','ventas'));
    }
    
}
