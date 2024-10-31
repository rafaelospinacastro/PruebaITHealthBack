using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PruebaITHealthBack.Database;
using PruebaITHealthBack.Models;

namespace PruebaITHealthBack.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PacientesController : ControllerBase
    {
        private readonly IthealthContext _context;

        public PacientesController(IthealthContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Obtener un todos los pacientes
        /// </summary>
        [HttpGet]
        public async Task<IList<Paciente>> Get()
        {
            return await _context.Pacientes.ToListAsync();
        }



        /// <summary>
        /// Obtener un paciente por ID.
        /// </summary>
        /// 
        [HttpGet("{id}")]
        public async Task<Paciente> BuscarPaciente(int? id)
        {
            
            var paciente = await _context.Pacientes
                .FirstOrDefaultAsync(m => m.Id == id);
            
            return paciente;
        }



        /// <summary>
        /// Crear paciente
        /// </summary>
        [HttpPost]
        public async Task<HttpStatusCode> Post(Paciente paciente)
        {
            try
            {
                _context.Add(paciente);
                await _context.SaveChangesAsync();
                return HttpStatusCode.OK;
            }
            catch(Exception ex)
            {
                return HttpStatusCode.BadRequest;
            }
            
            
        }

        /// <summary>
        /// Actualizar paciente
        /// </summary>
        [HttpPut]
        public async Task<HttpStatusCode> Put(int id, [Bind("Id,TipoDocumento,NumeroDocumento,Nombre,Email,FechaNacimiento,Genero,Direccion,Telefono,Activo")] Paciente paciente)
        {
            if (id != paciente.Id)
            {
                return HttpStatusCode.BadRequest;
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(paciente);
                    await _context.SaveChangesAsync();
                    return HttpStatusCode.OK;
                }
                catch (DbUpdateConcurrencyException)
                {
                    return HttpStatusCode.BadRequest;
                }
                
            }
            else { 
                return HttpStatusCode.BadRequest; 
            }
        }

        /// <summary>
        /// Borrar un paciente
        /// </summary>
        [HttpDelete("borrarpaciente/{id}")]
        public async Task<HttpStatusCode> Delete(int id)
        {
            try
            {
                var paciente = await _context.Pacientes.FindAsync(id);
                if (paciente != null)
                {
                    _context.Pacientes.Remove(paciente);
                }
                else
                {
                    return HttpStatusCode.BadRequest;
                }
                
                await _context.SaveChangesAsync();
                return HttpStatusCode.OK;
            }
            catch (Exception ex)
            {
                return HttpStatusCode.BadRequest;
            }
            
            
        }
        
        private bool PacienteExists(int id)
        {
            return _context.Pacientes.Any(e => e.Id == id);
        }
    }
}
