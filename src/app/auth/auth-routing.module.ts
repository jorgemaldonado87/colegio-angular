//modulo por defecto para rutas de autenticacion

import { AuthComponent } from './auth.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { RouterModule, Routes } from '@angular/router';
import { CrearColegioComponent } from './crear-colegio/crear-colegio.component';
import { SeleccionarColegioComponent } from './seleccionar-colegio/seleccionar-colegio.component';

const routes: Routes = [
  {
    path: 'auth',
    component: AuthComponent,
    children: [
      {
        path: 'login',
        component: LoginComponent
      },
      {
        path: 'register',
        component: RegisterComponent
      },
      {
        path: 'crear-colegio',
        component: CrearColegioComponent
      },
      {
        path: 'seleccionar-colegio',
        component: SeleccionarColegioComponent
      }
    ]
  }
];

export const AuthRoutingModule = RouterModule.forChild(routes);
