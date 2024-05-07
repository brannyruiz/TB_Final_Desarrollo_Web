import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ProjectService } from '../../services/project.service';
import { CartService } from '../../services/cart.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {


  constructor (private ps:ProjectService, private cartService: CartService){}

  projects : any = []


    __ProductosDestacados()
    {
      this.ps.__listarProductosDestacados_json().subscribe((rest:any) => {
        this.projects = rest.data
        console.log(this.projects)
      })
    }

    ngOnInit() : void
    {
      this.__ProductosDestacados()
    }


    agregarArticulo(producto: any){
      this.cartService.guardarArticulo(producto);
    }


}
