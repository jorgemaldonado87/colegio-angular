import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminComponent } from './admin.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { RouterModule, Routes } from '@angular/router';
import { MenuModule } from '../menu/menu.module';
import { CrearProfesorComponent } from './profesores/crear-profesor/crear-profesor.component';
import { CrearAlumnoComponent } from './alumnos/crear-alumno/crear-alumno.component';
import { CrearNivelComponent } from './niveles/crear-nivel/crear-nivel.component';
import { ListarNivelesComponent } from './niveles/listar-niveles/listar-niveles.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ListarCursosComponent } from './cursos/listar-cursos/listar-cursos.component';
import { CrearCursoComponent } from './cursos/crear-curso/crear-curso.component';
import { CrearMateriaComponent } from './materias/crear-materia/crear-materia.component';
import { ListarMateriasComponent } from './materias/listar-materias/listar-materias.component';
import { ListarPeriodosComponent } from './periodos/listar-periodos/listar-periodos.component';
import { CrearPeriodoComponent } from './periodos/crear-periodo/crear-periodo.component';


const routes: Routes = [
  {
    path: 'admin',
    component: AdminComponent,
    children: [

      {
        path: '',
        redirectTo: 'dashboard',
        pathMatch: 'full'
      },
      {
        path: 'dashboard',
        component: DashboardComponent
      },
      {
        path: 'profesores/crear-profesor',
        component: CrearProfesorComponent
      },
      {
        path: 'alumnos/crear-alumno',
        component: CrearAlumnoComponent
      },
      {
        path: 'niveles/crear-nivel',
        component: CrearNivelComponent
      },
      {
        path: 'niveles/listar-niveles',
        component: ListarNivelesComponent
      },
      {
        path: 'cursos',
        component: ListarCursosComponent
      },
      {
        path: 'cursos/crear-curso',
        component: CrearCursoComponent
      },
      {
        path: 'niveles',
        redirectTo: 'niveles/listar-niveles',
        pathMatch: 'full'
      },
      {
        path: 'materias/crear-materia',
        component: CrearMateriaComponent
      },
      {
        path: 'materias',
        component: ListarMateriasComponent
      },
      {
        path: 'periodos',
        component: ListarPeriodosComponent
      },
      {
        path: 'periodos/crear-periodo',
        component: CrearPeriodoComponent
      }
    ]
  }

];

@NgModule({
  declarations: [
    AdminComponent,
    DashboardComponent,
    CrearProfesorComponent,
    CrearAlumnoComponent,
    CrearNivelComponent,
    ListarNivelesComponent,
    ListarCursosComponent,
    CrearCursoComponent,
    CrearMateriaComponent,
    ListarMateriasComponent,
    ListarPeriodosComponent,
    CrearPeriodoComponent,

  ],
  imports: [
    CommonModule,
    RouterModule.forChild(routes),
    MenuModule,
    FormsModule,
    ReactiveFormsModule,
  ]
})
export class AdminModule { }
