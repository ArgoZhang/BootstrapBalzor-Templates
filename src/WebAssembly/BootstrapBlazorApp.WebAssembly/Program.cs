using BootstrapBlazorApp.WebAssembly;
using BootstrapBlazorApp.WebAssembly.Services;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

builder.Services.AddBootstrapBlazor(options =>
{
    options.IgnoreLocalizerMissing = true;
    options.DefaultCultureInfo = "zh-CN";
});

// 增加 Table 数据服务操作类
builder.Services.AddTableDemoDataService();

await builder.Build().RunAsync();
