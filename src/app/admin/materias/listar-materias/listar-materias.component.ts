import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-listar-materias',
  templateUrl: './listar-materias.component.html',
  styleUrls: ['./listar-materias.component.scss']
})
export class ListarMateriasComponent implements OnInit {

  materias: any = [];
  constructor(
    private api: ApiService,
    private router: Router
  ) { }


  ngOnInit(): void {
    this.cargarMaterias();
  }

  async cargarMaterias() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let materias: any = await this.api.get('colegios/' + colegio.id + '/materias');
      this.materias = materias.data;
    } catch (e) {
      console.log(e);
    }
  }

  editarMateria(materia: any) {
    this.router.navigate(['/admin/materias/editar-materia', materia.id]);
  }

  async eliminarMateria(materia: any) {

  }


}
