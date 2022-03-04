import { Component, OnInit } from '@angular/core';
//import { CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { TokenService } from 'src/app/security/service/token.service';
import { EducationService } from 'src/app/service/education.service';
import { Education } from 'src/app/models/education';
import { Router } from '@angular/router';
import { SectionsService } from 'src/app/service/sections.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-profile-education',
  templateUrl: './profile-education.component.html',
  styleUrls: ['./profile-education.component.css'],
})
export class ProfileEducationComponent implements OnInit {
  educationList: Education[] = [];
  person_id: number = 1;
  showAddForm: boolean = false;
  showUpdateForm: boolean = false;
  isAdmin = false;
  currentEducation: any;
  showEducationSection: boolean = true;
  school_logo: string = '../../../assets/logos/education/logoEducation.png';

  constructor(
    private tokenService: TokenService,
    private educationService: EducationService,
    private sectionsService: SectionsService,
    private toastr: ToastrService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.isAdmin = this.tokenService.isAdmin();
    this.getEducations();
    this.showEducation();
  }

  toggleAddForm() {
    this.showAddForm = !this.showAddForm;
  }

  toggleUpdateForm(education?: Education) {
    this.showUpdateForm = !this.showUpdateForm;
    this.currentEducation = education;
  }

  showEducation() {
    this.sectionsService.showEducationSection.subscribe((data) => {
      this.showEducationSection = data;
    });
  }

  refreshComponent() {
    this.router
      .navigateByUrl('/RefreshComponent', { skipLocationChange: true })
      .then(() => {
        this.router.navigate(['portfolio']);
      });
  }

  getEducations() {
    this.educationService.getEducations(this.person_id).subscribe((data) => {
      this.educationList = data;
      if (this.educationList.length === 0) {
        this.showEducationSection = false;
      }
    });
  }

  addEducation(education: Education) {
    let {
      name,
      description,
      start_date,
      end_date,
      school: school_id,
    } = education;
    const newEducation = { name, description, start_date, end_date };
    this.educationService
      .addEducation(this.person_id, school_id, newEducation)
      .subscribe(
        (data) => {
          this.toastr.success(
            'La disciplina académica "' +
              data.name +
              '" ha sido agregada a la cuenta!',
            'Educación agregada',
            {
              timeOut: 3000,
              positionClass: 'toast-top-center',
            }
          );
          this.refreshComponent();
        },
        (err) => {
          this.toastr.error(err.error.message, 'Error', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
        }
      );
    this.toggleAddForm();
  }

  updateEducation(education: Education) {
    let {
      id: education_id,
      name,
      school: school_id,
      description,
      start_date,
      end_date,
    } = education;
    const updatedEducation = { name, description, start_date, end_date };
    this.educationService
      .updateEducation(
        education_id!,
        this.person_id,
        school_id,
        updatedEducation
      )
      .subscribe(
        (data) => {
          this.toastr.success(
            'La disciplina académica "' + name + '" ha sido modificada!',
            'Modificación exitosa',
            {
              timeOut: 3000,
              positionClass: 'toast-top-center',
            }
          );
          this.refreshComponent();
        },
        (err) => {
          this.toastr.error(err.error.message, 'Error', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
        }
      );
    this.toggleUpdateForm();
  }

  deleteEducation(education: Education) {
    let education_id = education.id;

    this.educationService
      .deleteEducation(education_id!, this.person_id)
      .subscribe(
        (data) => {
          this.toastr.success(
            'La disciplina académica "' +
              education.name +
              '" ha sido eliminada!',
            'Eliminación exitosa',
            {
              timeOut: 3000,
              positionClass: 'toast-top-center',
            }
          );
          this.refreshComponent();
        },
        (err) => {
          this.toastr.error(err.error.message, 'Error', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
        }
      );
  }

  deleteAllEducationsFromPerson() {
    this.educationService
      .deleteAllEducationsFromPerson(this.person_id)
      .subscribe(
        (data) => {
          this.toastr.success(
            'Todas las disciplinas académicas han sido eliminadas!',
            'Eliminación exitosa',
            {
              timeOut: 3000,
              positionClass: 'toast-top-center',
            }
          );
          this.refreshComponent();
        },
        (err) => {
          this.toastr.error(err.error.message, 'Error', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
          });
        }
      );
  }
}
