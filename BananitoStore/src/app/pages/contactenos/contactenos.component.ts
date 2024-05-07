import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-contactenos',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './contactenos.component.html',
  styleUrl: './contactenos.component.css'
})
export class ContactenosComponent {
  constructor(private fb:FormBuilder) {}

  contactusForm = this.fb.group({
    persona: this.fb.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required]
    }),
    correo: ['', [Validators.required, Validators.email]],
    comentarios: ['', Validators.required]
  })

  __on_enviar() {
    if(this.contactusForm.valid) {
      console.log(this.contactusForm.value)
    } else {
      alert("Formulario no valido")
    }
  }

}
