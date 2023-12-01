using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.Services.AddBootstrapBlazor();

builder.Services.AddTableDemoDataService();

await builder.Build().RunAsync();
