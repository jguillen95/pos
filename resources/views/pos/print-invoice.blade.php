@php
    setlocale(LC_TIME, 'es_ES'); // Establecer la configuración regional a español
    $fecha_actual = \Carbon\Carbon::now()->formatLocalized('%d de %B de %Y');
@endphp
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>JOSOLUTIONS POS</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="{{ asset('assets/images/logo/logo-min.png') }}"/>
        <link rel="stylesheet" href="{{ asset('assets/css/backend-plugin.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/css/backend.css?v=1.0.0') }}">
        <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="{{ asset('assets/vendor/remixicon/fonts/remixicon.css') }}">
    </head>
<body>

    <!-- Wrapper Start -->
    <div class="wrapper" style="width:130mm;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card card-block">
                        <div class="card-header d-flex justify-content-center bg-primary">
                            <div class="iq-header-title">
                            <h4 class="card-title mb-0 text-center">Ticket de Venta</h4>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <center><img src="{{ asset('assets/images/logo/hdz.png') }}" class="logo-invoice img-fluid mb-3"></center>
                                    <h5 class="mb-3 text-center">Hola, {{ $customer->name }}</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <p>Fecha: <strong>{{ $fecha_actual }}</strong></p>
                                    <p>Cliente: <strong>{{ $customer->address }}</strong><br>
                                        Teléfono: {{ $customer->phone }}<br>
                                        Email: {{ $customer->email }}<br></p>
                                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <h5 class="mb-3">Resumen de Venta</h5>
                                    <div class="col-12">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" scope="col">#</th>
                                                    <th scope="col">Artículo</th>
                                                    <th class="text-center" scope="col">Cantidad</th>
                                                    <th class="text-center" scope="col">Precio</th>
                                                    <th class="text-center" scope="col">Totales</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($content as $item)
                                                <tr>
                                                    <th class="text-center" scope="row">{{ $loop->iteration }}</th>
                                                    <td>
                                                        <h6 class="mb-0">{{ $item->name }}</h6>
                                                    </td>
                                                    <td class="text-center">{{ $item->qty }}</td>
                                                    <td class="text-center">{{ $item->price }}</td>
                                                    <td class="text-center"><b>{{ $item->subtotal }}</b></td>
                                                </tr>

                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4 mb-3">
                                <div class="offset-lg-2 col-lg-8">
                                    <div class="or-detail rounded">
                                        <div class="p-3">
                                            <h5 class="mb-3">Detalles de la compra</h5>
                                            <div class="mb-2">
                                                <h6>Sub Total</h6>
                                                <p>${{ Cart::subtotal() }}</p>
                                            </div>
                                            <div>
                                                <h6>Descuento</h6>
                                                <p>${{ Cart::tax() }}</p>
                                            </div>
                                        </div>
                                        <div class="ttl-amt py-2 px-3 d-flex justify-content-between align-items-center">
                                            <h6>Total</h6>
                                            <h3 class="text-primary font-weight-700">${{ Cart::total() }}</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Wrapper End-->

    <script>
    window.addEventListener("load", (event) => {
        window.print();
    });
    </script>
</body>
</html>
