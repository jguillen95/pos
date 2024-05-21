@extends('dashboard.body.main')

@section('container')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
        @if (session()->has('success'))
            <div class="alert text-white bg-success" role="alert">
                <div class="iq-alert-text">{{ session('success') }}</div>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <i class="ri-close-line"></i>
                </button>
            </div>
        @endif
        </div>
        <div class="col-lg-3">
            <div class="card card-transparent card-block card-stretch card-height border-none">
                <div class="card-body p-0 mt-lg-2 mt-0">
                    <h3 class="mb-3">Hola {{ auth()->user()->name }}, Buen día🙂</h3>
                    <p class="mb-0 mr-4">Panel ofrece vistas clave desempeño.</p>
                </div>
            </div>
        </div> 
        <div class="col-lg-9">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card card-block card-stretch card-height">
                        <div class="card-body bg-primary">
                            <div class="d-flex align-items-center mb-4 card-total-sale">
                                <div class="icon iq-icon-box-2 bg-info-light">
                                    <img src="../assets/images/product/1.png" class="img-fluid" alt="image">
                                </div>
                                <div>
                                    <p class="mb-2">Ventas de Hoy</p>
                                    <h4>$ {{ $total_fecha }}</h4>
                                </div>
                            </div>
                            <div class="iq-progress-bar mt-2">
                                <span class="bg-info iq-progress progress-1" data-percent="85">
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="card card-block card-stretch card-height">
                        <div class="card-body bg-danger">
                            <div class="d-flex align-items-center mb-4 card-total-sale">
                                <div class="icon iq-icon-box-2 bg-danger-light">
                                    <img src="../assets/images/product/2.png" class="img-fluid" alt="image">
                                </div>
                                <div>
                                    <p class="mb-2">Empleados</p>
                                    <h4> {{ count($employees) }}</h4>
                                </div>
                            </div>
                            <div class="iq-progress-bar mt-2">
                                <span class="bg-danger-light iq-progress progress-1" data-percent="70">
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="card card-block card-stretch card-height">
                        <div class="card-body bg-success">
                            <div class="d-flex align-items-center mb-4 card-total-sale">
                                <div class="icon iq-icon-box-2 bg-success-light">
                                    <img src="../assets/images/product/3.png" class="img-fluid" alt="image">
                                </div>
                                <div>
                                    <p class="mb-2">Ventas</p>
                                    <h4>{{ count($complete_orders) }}</h4>
                                </div>
                            </div>
                            <div class="iq-progress-bar mt-2">
                                <span class="bg-success-light iq-progress progress-1" data-percent="75">
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg 12">
            <div class="container">
                <div class="card card-transparent card-block card-stretch mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between p-0">
                        <div class="header-title">
                            <h4 class="card-title mb-0">Reporte de ventas</h4>
                        </div>
                        <div class="card-header-toolbar d-flex align-items-center">
                            <form action="{{ route('dashboard.search') }}" method="get">
                                <div class="form-row align-items-center">
                                  <div class="col-auto">
                                    <label class="sr-only" for="inlineFormInput">Fecha 1</label>
                                    <input type="date" class="form-control mb-2" id="inlineFormInput" name="fecha_inicio">
                                  </div>
                                  <div class="col-auto">
                                    <label class="sr-only" for="inlineFormInput">Fecha 2</label>
                                    <input type="date" class="form-control mb-2" id="inlineFormInput" name="fecha_final">
                                  </div>
                                  <div class="col-auto">
                                    <label class="sr-only" for="inlineFormInput">Empleado</label>
                                    <select class="form-control mb-2" id="inlineFormInput" name="employee">
                                        @foreach ($employees as $item)
                                        <option value="{{$item->id}}">{{$item->name}}</option>
                                        @endforeach
                                    </select>
                                  </div>
                                  <div class="col-auto">
                                    <button type="submit" class="btn btn-primary mb-2">Consultar</button>
                                  </div>
                                </div>
                              </form>
                        </div>
                    </div>
                </div>
                <div class="card card-transparent card-block card-stretch mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between p-0">
                        <div class="header-title">
                            <h4 class="card-title mb-0">Corte de Caja</h4>
                        </div>

                        <div class="card-header-toolbar d-flex align-items-center">
                            <form action="{{ route('dashboard.corte') }}" method="get">
                                <div class="form-row align-items-center">
                                  <div class="col-auto">
                                    <input type="hidden" class="form-control mb-2" id="inlineFormInput" value="{{date("Y-m-d")}}" name="fecha_corte">
                                  </div>
                                  <div class="col-auto">
                                    <button type="submit" class="btn btn-primary mb-2">Corte de caja</button>
                                  </div>
                                </div>
                              </form>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
           
        <div class="col-lg-4">
            <div class="card card-transparent card-block card-stretch mb-4">
                <div class="card-header d-flex align-items-center justify-content-between p-0">
                    <div class="header-title">
                        <h4 class="card-title mb-0">Productos</h4>
                    </div>
                    <div class="card-header-toolbar d-flex align-items-center">
                        <div><a href="#" class="btn btn-primary view-btn font-size-14">Ver todo</a></div>
                    </div>
                </div>
            </div>
            @foreach ($new_products as $product)
            <div class="card card-block card-stretch card-height-helf">
                <div class="card-body card-item-right">
                    <div class="d-flex align-items-top">
                        <div class="bg-warning-light rounded">
                            <img src="../assets/images/product/04.png" class="style-img img-fluid m-auto" alt="image">
                        </div>
                        <div class="style-text text-left">
                            <h5 class="mb-2">{{ $product->product_name }}</h5>
                            <p class="mb-2">precio de compra : {{ $product->buying_price }}</p>
                            <p class="mb-0">Precio : ${{ $product->selling_price }}</p>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
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
