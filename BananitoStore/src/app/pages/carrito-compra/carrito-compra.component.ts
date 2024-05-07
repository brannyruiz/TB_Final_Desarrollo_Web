import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { ProjectService } from '../../services/project.service';

@Component({
  selector: 'app-carrito-compra',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './carrito-compra.component.html',
  styleUrl: './carrito-compra.component.css',
})
export class CarritoCompraComponent {
  constructor(private ps: ProjectService, private cartService: CartService) {}

  articulos: any = [];
  subtotal: number = 0.0;
  igv: number = 0.0;
  total: number = 0.0;
  costo_envio: number = 0.0;

  ngOnInit(): void {
    this.articulos = this.cartService.obtenerItems();
    console.log(this.articulos);

    this.resumen_compra();
  }

  quitarProductoAlCarrito(producto: any) {
    this.cartService.quitarAlCarrito(producto);
    this.articulos = this.cartService.obtenerItems();

    this.resumen_compra();
  }

  vaciarCarrito() {
    this.cartService.vaciarCarrito();
    this.articulos = this.cartService.obtenerItems();

    this.subtotal = 0.0;
    this.igv = 0.0;
    this.total = 0.0;
  }

  resumen_compra() {
    this.subtotal = 0.0;

    for (let item of this.articulos) {
      this.subtotal = this.subtotal + item.precio * item.cantidad;
    }

    this.igv = this.subtotal * 0.18;
    this.total = this.subtotal + this.igv;
  }

  seleccionar_envio(valor: number) {
    this.costo_envio = valor;
  }
}
