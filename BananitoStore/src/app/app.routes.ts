import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { CarritoCompraComponent } from './pages/carrito-compra/carrito-compra.component';
import { MarcasComponent } from './pages/marcas/marcas.component';
import { OfertasComponent } from './pages/ofertas/ofertas.component';
import { NosotrosComponent } from './pages/nosotros/nosotros.component';
import { ContactenosComponent } from './pages/contactenos/contactenos.component';
import { DetalleCompraComponent } from './pages/detalle-compra/detalle-compra.component';

export const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'carritoCompra', component: CarritoCompraComponent },
  { path: 'ofertas', component: OfertasComponent },
  { path: 'marcas', component: MarcasComponent },
  { path: 'nosotros', component: NosotrosComponent },
  { path: 'contactenos', component: ContactenosComponent },
  { path: 'detalleCompra', component: DetalleCompraComponent },
];
