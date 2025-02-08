export class Cigar {
  id: number;
  brand: string;
  name: string;
  description: string;
  lengthRing: string;
  shade: string;
  strength: string;
  singlePrice: number;
  yearIntro: number;
  completed: boolean;
  createDate: string | null;
  lastUpdate: string | null;
  imageUrl: string;

  constructor(
    id: number = 0,
    brand: string = '',
    name: string = '',
    description: string = '',
    lengthRing: string = '',
    shade: string = '',
    strength: string = '',
    singlePrice: number = 0,
    yearIntro: number = 0,
    completed: boolean = false,
    createDate: string = '',
    lastUpdate: string = '',
    imageUrl: string = ','
) {
  this.id = id;
  this.brand = brand;
  this.name = name;
  this.description = description;
  this.lengthRing = lengthRing;
  this.shade = shade;
  this.strength = strength;
  this.singlePrice = singlePrice;
  this.yearIntro = yearIntro;
  this.completed = completed;
  this.createDate = createDate;
  this.lastUpdate = lastUpdate;
  this.imageUrl = imageUrl;
}



}
