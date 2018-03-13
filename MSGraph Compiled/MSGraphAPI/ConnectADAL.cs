using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System.Runtime.InteropServices;

namespace MSGraphAPI
{
    public class ConnectADAL
    {
        public static AuthenticationResult GetGraphClientByUserAndPassword(string Tenant, string ClientId, string RedirectURI, string Resource, string User, SecureString Password)
        {
            string authority = "https://login.microsoftonline.com/" + Tenant;
            var authenticationContext = new AuthenticationContext(authority);
            AuthenticationResult AuthenticationResult;
            IntPtr valuePtr = IntPtr.Zero;
            valuePtr = Marshal.SecureStringToGlobalAllocUnicode(Password);
            string strPassword = Marshal.PtrToStringUni(valuePtr);
            Marshal.ZeroFreeGlobalAllocUnicode(valuePtr);
            var aadCredential = new UserPasswordCredential(User, strPassword);
            try
            {
                var taskResult = authenticationContext.AcquireTokenAsync(Resource, ClientId, aadCredential);
                AuthenticationResult = taskResult.GetAwaiter().GetResult();
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("The user or administrator has not consented to use the application"))
                {
                    var tempURI = new Uri(RedirectURI);
                    var taskResult = authenticationContext.AcquireTokenAsync(Resource, ClientId, tempURI, new PlatformParameters(PromptBehavior.Always));
                    AuthenticationResult = taskResult.GetAwaiter().GetResult();
                }
                else
                {
                    throw ex;
                }
            }
            return AuthenticationResult;
        }
    }
}
