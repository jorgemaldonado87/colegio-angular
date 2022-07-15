import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthComponent } from './auth.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { AuthRoutingModule } from './auth-routing.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CrearColegioComponent } from './crear-colegio/crear-colegio.component';
import { SeleccionarColegioComponent } from './seleccionar-colegio/seleccionar-colegio.component';




@NgModule({
  declarations: [


    AuthComponent,
        LoginComponent,
        RegisterComponent,
        CrearColegioComponent,
        SeleccionarColegioComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    AuthRoutingModule

  ]
})
export class AuthModule { }
