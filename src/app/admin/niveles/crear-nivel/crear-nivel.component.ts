import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-crear-nivel',
  templateUrl: './crear-nivel.component.html',
  styleUrls: ['./crear-nivel.component.scss']
})
export class CrearNivelComponent implements OnInit {

  //crearNivelForm, nivel tiene id, nombre, colegio_id
  //colegio_id es el id del colegio que esta logueado, obtenido de localStorage
  crearNivelForm = new FormGroup({
    nombre: new FormControl(''),
  });

  constructor(private api: ApiService, private router:Router) { }

  ngOnInit(): void {
  }

  async crearNivel() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let nivel = await this.api.post('colegios/' + colegio.id + '/niveles', this.crearNivelForm.value);
      this.router.navigate(['/admin/niveles/listar-niveles']);
      console.log(nivel);
    } catch (e) {
      console.log(e);
    }

  }
}
