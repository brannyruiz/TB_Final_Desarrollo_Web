import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { CarritoCompraComponent } from './pages/carrito-compra/carrito-compra.component';
import { OfertasComponent } from './pages/ofertas/ofertas.component';
import { MarcasComponent } from './pages/marcas/marcas.component';
import { NosotrosComponent } from './pages/nosotros/nosotros.component';
import { ContactenosComponent } from './pages/contactenos/contactenos.component';
import { DetalleCompraComponent } from './pages/detalle-compra/detalle-compra.component';

const router: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'carritoCompra', component: CarritoCompraComponent },
  { path: 'ofertas', component: OfertasComponent },
  { path: 'marcas', component: MarcasComponent },
  { path: 'nosotros', component: NosotrosComponent },
  { path: 'contactenos', component: ContactenosComponent },
  { path: 'detalleCompra', component: DetalleCompraComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(router)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
