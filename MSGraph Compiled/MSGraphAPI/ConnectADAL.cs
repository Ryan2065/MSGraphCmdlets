using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Graph;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System.Net.Http.Headers;
using System.Runtime.InteropServices;

namespace MSGraphAPI
{
    public class ConnectADAL
    {
        public static GraphServiceClient GetGraphClientByUserAndPassword(string Tenant, string ClientId, string RedirectURI, string Resource, string User, SecureString Password, string GraphEndpoint = "v1.0")
        {
            string tempGraphEndPoint = "https://graph.microsoft.com/" + GraphEndpoint;
            string authority = "https://login.microsoftonline.com/" + Tenant;
            var authenticationContext = new AuthenticationContext(authority);
            GraphServiceClient graphClient = new GraphServiceClient(tempGraphEndPoint, new DelegateAuthenticationProvider(
                async (requestMessage) =>
                {
                    IntPtr valuePtr = IntPtr.Zero;
                    valuePtr = Marshal.SecureStringToGlobalAllocUnicode(Password);
                    string strPassword = Marshal.PtrToStringUni(valuePtr);
                    Marshal.ZeroFreeGlobalAllocUnicode(valuePtr);
                    var aadCredential = new UserPasswordCredential(User, strPassword);
                    AuthenticationResult AuthenticationResult;
                    try
                    {
                        AuthenticationResult = await authenticationContext.AcquireTokenAsync(Resource, ClientId, aadCredential);
                    }
                    catch (Exception ex)
                    {
                        if (ex.Message.Contains("The user or administrator has not consented to use the application"))
                        {
                            var tempURI = new Uri(RedirectURI);
                            AuthenticationResult = await authenticationContext.AcquireTokenAsync(Resource, ClientId, tempURI, new PlatformParameters(PromptBehavior.Always));
                        }
                        else
                        {
                            throw ex;
                        }
                    }
                    string token = AuthenticationResult.AccessToken;
                    requestMessage.Headers.Authorization = new AuthenticationHeaderValue("bearer", token);
                }
            ));
            return graphClient;
        }
    }
}
