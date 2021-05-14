from django.db import models

# Modelos (entidades en la base de datos).
class PostalCode(models.Model):
    """La entidad código postal para la dirección."""
    code = models.CharField(primary_key=True, max_length=12)

    def __str__(self):
        return self.code


class City(models.Model):
    """La entidad ciudad para la dirección."""
    name = models.CharField(max_length=128)

    def __str__(self):
        return self.name


class Street(models.Model):
    """La entidad calle para la dirección."""
    name = models.CharField(max_length=128)

    def __str__(self):
        return self.name


class Address(models.Model):
    """La entidad dirección, que referencía a otras entidades calle, ciudad,
    código postal."""
    street = models.ForeignKey(Street, on_delete=models.CASCADE)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    postal_code = models.ForeignKey(PostalCode, on_delete=models.CASCADE)
    number = models.IntegerField()

    def __str__(self):
        return f"Calle: {self.street.name}\nCiudad: {self.city.name}\nNúmero: {self.number}"


class Editor(models.Model):
    """La entidad editorial con su nombre y dirección."""
    address = models.ForeignKey(Address, on_delete=models.CASCADE)
    name = models.CharField(max_length=128)
    country = models.CharField(max_length=128)

    def __str__(self):
        return self.name


class Author(models.Model):
    """La entidad autor, con nombre, país y una imagen suya."""
    name = models.CharField(max_length=128)
    country = models.CharField(max_length=128)
    photo = models.ImageField()

    def __str__(self):
        return f"Nombre:{self.name}\nPaís:{self.country}\n"


class Book(models.Model):
    """ El modelo de algún libro en el catálogo.
    tiene su ISBN como llave primaria, autor y
    editorial como foránea y otros atributos
    misceláneos como el título, fecha de publicación,
    etc."""
    isbn = models.CharField(max_length=13, primary_key=True)
    author = models.ForeignKey(Author, on_delete=models.CASCADE)
    editor = models.ForeignKey(Editor, on_delete=models.CASCADE)
    title = models.CharField(max_length=255)
    year = models.IntegerField()
    country = models.CharField(max_length=128)
    genre = models.CharField(max_length=128)
    cover = models.ImageField()

    def __str__(self):
        return self.title
