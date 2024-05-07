import { AfterViewInit, Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-cargando',
  standalone: true,
  imports: [],
  templateUrl: './cargando.component.html',
  styleUrl: './cargando.component.css',
})
export class CargandoComponent implements AfterViewInit {
  ngAfterViewInit(): void {
    setTimeout(() => {
      this.router.navigate(['confirmacionCompra']);
    }, 2500);
  }

  constructor(private router: Router) {}
}
