import { CigarService } from './../../services/cigar.service';
import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Cigar } from '../../models/cigar';

@Component({
  selector: 'app-home',
  imports: [
    CommonModule,
    FormsModule,
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {

  cigars: Cigar[] = [];
  selected: Cigar | null = null;
  newCigar: Cigar = new Cigar();
  editCigar: Cigar | null = null;
  showComplete: boolean = false;

  constructor(
    private cigarService: CigarService,
  ) {}

  ngOnInit(): void {
    this.loadCigars();
  }

  loadCigars(): void {
    this.cigarService.index().subscribe( {
      next: (cigarList) => {
      this.cigars = cigarList;
    },
      error: (someError) => {
        console.error('HomeComponent.loadCigars: error');
        console.error(someError);
      }
    } );
  }

  displayCigar(cigar: Cigar) : void {
    this.selected = cigar;
  }

  displayTable() : void {
    this.selected = null;
  }

  addCigar(cigar: Cigar) : void {
    this.cigarService.create(cigar).subscribe({
      next: (cigars) => {
        this.loadCigars();
      },
      error: (error) => {
        console.log(error);
        console.log("Error creating cigar in home.component");
      }
    });
  }

  generateId() : number {
    return this.cigars[this.cigars.length -1].id + 1;
  }

  setEditCigar() : void {
    this.editCigar = Object.assign({}, this.selected);
  }

  deleteCigar(id: number) : void {
    this.cigarService.destroy(id).subscribe({
      next: (cigars) => {
        this.loadCigars();
      },
      error: (error) => {
        console.log(error);
        console.log("Error deleting cigar in home.component");
      }
    });
  }

  updateCigar(cigar: Cigar, setSelected: boolean = true) {
    this.cigarService.update(cigar).subscribe({
      next: (cigars) => {
        this.loadCigars();
        if(setSelected) {
          this.selected = cigar;
          this.editCigar = null;
        }
      },
      error: (error) => {
        console.log(error);
        console.log("Error updating cigar in home.component");
      }
    });
  }

  selectedCigar(cigar: Cigar) {
    this.selected = cigar;
    console.log("click working");
  }



}
