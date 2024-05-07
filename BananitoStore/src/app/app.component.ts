import { Component, EventEmitter, Input, Output } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CartService } from './services/cart.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'BananitoStore';

  @Input() itemCount: number = 0;


  constructor(private cartService: CartService) {}

  get cantidadItems() {
    return this.cartService.obtenerCantidad();
  }

  ngOnInit() : void
  {
    //this.cartService.vaciarCarrito();
  }



}
