using BootstrapBlazorApp.Client.Services;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.Services.AddBootstrapBlazor();

// 增加 Table 数据服务操作类
builder.Services.AddTableDemoDataService();

await builder.Build().RunAsync();
