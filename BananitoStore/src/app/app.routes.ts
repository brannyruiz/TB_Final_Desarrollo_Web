import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { CarritoCompraComponent } from './pages/carrito-compra/carrito-compra.component';

export const routes: Routes = [
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'carritoCompra', component: CarritoCompraComponent },
];
