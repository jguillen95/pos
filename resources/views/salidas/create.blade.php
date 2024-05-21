@extends('dashboard.body.main')

@section('container')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-10 mt-5 ml-5">
            {{-- Inicia form --}}
            <div class="card-body">
                <form action="{{ route('salidas.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                    <div class=" row align-items-center">
                        <div class="form-group col-md-12">
                            <label for="tipo_salida">Tipo de Salida<span class="text-danger">*</span></label>
                            <select type="text" class="form-control" id="tipo_salida" name="tipo_salida" required>
                            <option selected="" disabled>-- Selecciona algo --</option>
                            <option value="adelanto">ADELANTO</option>
                            <option value="compra">COMPRA DE INSUMO</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="employee">Empleado que solicita <span class="text-danger">*</span></label>
                            <select class="form-control" name="employee" required>
                                <option selected="" disabled>-- Selecciona algo --</option>
                                @foreach ($employees as $employee)
                                    <option value="{{ $employee->id }}">{{ $employee->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="cantidad">Cantidad que Solicita</label>
                            <input type="number" class="form-control" id="cantidad" name="cantidad" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="motivo">Motivo de salida</label>
                            <input type="text" class="form-control" id="motivo" name="motivo" required>
                        </div>
                        
                    <!-- end: Input Data -->
                    <div class="mt-2">
                        <button type="submit" class="btn btn-success mr-2">Guardar</button>
                    </div>
                </form>
            </div>
            {{-- Termina form --}}
        </div>
    </div>
    
    <!-- Page end  -->
</div>
<a href="{{ route('salidas.create') }}" class="btn btn-primary add-list mx-1">Crear otra</a>
@endsection

@section('specificpagescripts')
<!-- Table Treeview JavaScript -->
<script src="{{ asset('assets/js/table-treeview.js') }}"></script>
<!-- Chart Custom JavaScript -->
<script src="{{ asset('assets/js/customizer.js') }}"></script>
<!-- Chart Custom JavaScript -->
<script async src="{{ asset('assets/js/chart-custom.js') }}"></script>
@endsection
