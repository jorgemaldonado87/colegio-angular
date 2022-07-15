import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-crear-materia',
  templateUrl: './crear-materia.component.html',
  styleUrls: ['./crear-materia.component.scss']
})
export class CrearMateriaComponent implements OnInit {

  crearMateriaForm = new FormGroup({
    nombre: new FormControl(''),
  });

  constructor(
    private api: ApiService,
    private router: Router
  ) { }

  ngOnInit(): void {
  }

  async crearMateria() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let materia = await this.api.post('colegios/' + colegio.id + '/materias', this.crearMateriaForm.value);
      console.log(materia);
      this.router.navigate(['/admin/materias']);
    }
    catch (e) {
      console.log(e);
    }
  }



}
