using Dapper;
using DBEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBContext
{
    public class UserRepository : BaseRepository, IUserRepository
    {

        public EntityBaseResponse Login(EntityUserLogin login) {

            var response = new EntityBaseResponse();

            try 
            {
                
                var user = new EntityUser();
                const string sql = "SP_Logear_Usuario";


                using (var db = GetSqlConnection()) 
                {
                    var p = new DynamicParameters();
                    p.Add(name: "@Login", value: login.LoginUsuario, dbType: DbType.String, direction: ParameterDirection.Input);
                    p.Add(name: "@Clave", value: login.ClaveUsuario, dbType: DbType.String, direction: ParameterDirection.Input);

                    user = db.Query<EntityUser>(
                            sql: sql,
                            param: p,
                            commandType: CommandType.StoredProcedure                        
                        ).FirstOrDefault();

                    if (user != null)
                    {

                        response.IsSuccess = true;
                        response.ErrorCode = "00";
                        response.ErrorMessage = string.Empty;
                        response.Data = user;
                    }
                    else 
                    {
                        response.IsSuccess = false;
                        response.ErrorCode = "00";
                        response.ErrorMessage = string.Empty;
                        response.Data = null;

                    }
                }

            }
            catch (Exception ex) 
            {
                response.IsSuccess = false;
                response.ErrorCode = "01";
                response.ErrorMessage = string.Empty;
                response.Data = null;

            }

            return response;

        }

       
    }
}
