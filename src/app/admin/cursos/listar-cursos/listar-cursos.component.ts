import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-listar-cursos',
  templateUrl: './listar-cursos.component.html',
  styleUrls: ['./listar-cursos.component.scss']
})
export class ListarCursosComponent implements OnInit {

  cursos: any = [];

  constructor(private api: ApiService) { }

  ngOnInit(): void {
    this.cargarCursos();
  }

  async cargarCursos() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let cursos: any = await this.api.get('colegios/' + colegio.id + '/cursos');
      this.cursos = cursos.data;
    } catch (e) {
      console.log(e);
    }
  }

  editarCurso(curso: any) {
    console.log(curso);
  }

  eliminarCurso(curso: any) {
    console.log(curso);
  }


}
