using System;
using System.Collections.Generic;

namespace PruebaITHealthBack.Models;

public partial class Paciente
{
    public int Id { get; set; }

    public string? TipoDocumento { get; set; }

    public string? NumeroDocumento { get; set; }

    public string? Nombre { get; set; }

    public string? Email { get; set; }

    public DateTime? FechaNacimiento { get; set; }

    public string? Genero { get; set; }

    public string? Direccion { get; set; }

    public int? Telefono { get; set; }

    public bool? Activo { get; set; }
}
