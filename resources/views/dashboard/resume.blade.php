@extends('dashboard.body.main')

@section('container')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 mt-5 ml-5">
            <h3 class="mb-3">Reporte de Ventas entre fechas</h3>
        <table class="table table-striped">
            <thead>
              <tr>
                <th scope="col">Venta</th>
                <th scope="col">Total de piezas</th>
                <th scope="col">Total</th>
                <th scope="col">Empleado que vendió</th>
              </tr>
            </thead>
            <tbody>
            @foreach ($ventas as $item)
              <tr>
                <th scope="row">{{$item->invoice_no}}</th>
                <td>{{$item->total_products}}pz</td>
                <td>${{$item->total}}</td>
                <td>{{$item->name}}</td>
              </tr>
            @endforeach
            <td ></th>
                <td></td>
                <td scope="row">${{$resume}}</td>
                <td></td>
            </tbody>
          </table>
        </div>
    </div>
    <a href="{{ route('dashboard') }}" class="btn btn-primary add-list mx-1">Volver a filtrar</a>
    <!-- Page end  -->
</div>
@endsection

@section('specificpagescripts')
<!-- Table Treeview JavaScript -->
<script src="{{ asset('assets/js/table-treeview.js') }}"></script>
<!-- Chart Custom JavaScript -->
<script src="{{ asset('assets/js/customizer.js') }}"></script>
<!-- Chart Custom JavaScript -->
<script async src="{{ asset('assets/js/chart-custom.js') }}"></script>
@endsection
