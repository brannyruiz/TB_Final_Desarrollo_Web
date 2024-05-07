using Dapper;
using DBContext;
using DBEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBContext
{
    public class Productos : BaseRepository, IProductos
    {
        public EntityBaseResponse GetDetalleProducto(int idProducto)
        {
            throw new NotImplementedException();
        }

        public EntityBaseResponse GetProductosDestacados()
        {
            var response = new EntityBaseResponse();

            try
            {
                using (var db = GetSqlConnection())
                {
                    var productos = new List<EntityProductosDestacadas>();

                    const string sql = "SP_Listar_Productos_Destacadas";
                    productos = db.Query<EntityProductosDestacadas>(
                            sql: sql,
                            commandType: CommandType.StoredProcedure
                        ).ToList();

                    if (productos.Count > 0)
                    {

                        response.IsSuccess = true;
                        response.ErrorCode = "00";
                        response.ErrorMessage = string.Empty;
                        response.Data = productos;
                    }
                    else
                    {
                        response.IsSuccess = false;
                        response.ErrorCode = "0000";
                        response.ErrorMessage = string.Empty;
                        response.Data = null;
                    }
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.ErrorCode = "0001";
                response.ErrorMessage = ex.Message;
                response.Data = null;
            }

            return response;
        }

        public EntityBaseResponse GetProductos_x_Marca(int idMarca)
        {
            var response = new EntityBaseResponse();

            try
            {
                using (var db = GetSqlConnection())
                {
                    var productos = new List<EntityProductosDestacadas>();

                    const string sql = "SP_Listar_Producto_x_Marcas";
                    var p = new DynamicParameters();
                    p.Add(name: "@idMarca", value: idMarca, dbType: DbType.Int32, direction: ParameterDirection.Input);

                    productos = db.Query<EntityProductosDestacadas>(
                            sql: sql,
                            param: p,
                            commandType: CommandType.StoredProcedure
                        ).ToList();

                    if (productos.Count > 0)
                    {

                        response.IsSuccess = true;
                        response.ErrorCode = "00";
                        response.ErrorMessage = string.Empty;
                        response.Data = productos;
                    }
                    else
                    {
                        response.IsSuccess = false;
                        response.ErrorCode = "0000";
                        response.ErrorMessage = string.Empty;
                        response.Data = null;
                    }
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.ErrorCode = "0001";
                response.ErrorMessage = ex.Message;
                response.Data = null;
            }

            return response;
        }

        public EntityBaseResponse GetProductos_x_Oferta()
        {
            var response = new EntityBaseResponse();

            try
            {
                using (var db = GetSqlConnection())
                {
                    var productos = new List<EntityProductosDestacadas>();

                    const string sql = "SP_Listar_Producto_x_Ofertas";
                    productos = db.Query<EntityProductosDestacadas>(
                            sql: sql,
                            commandType: CommandType.StoredProcedure
                        ).ToList();

                    if (productos.Count > 0)
                    {

                        response.IsSuccess = true;
                        response.ErrorCode = "00";
                        response.ErrorMessage = string.Empty;
                        response.Data = productos;
                    }
                    else
                    {
                        response.IsSuccess = false;
                        response.ErrorCode = "0000";
                        response.ErrorMessage = string.Empty;
                        response.Data = null;
                    }
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.ErrorCode = "0001";
                response.ErrorMessage = ex.Message;
                response.Data = null;
            }

            return response;
        }
    }
}
