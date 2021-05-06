using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using System;
using System.Threading.Tasks;

namespace BootstrapBlazorApp.Shared
{
    /// <summary>
    /// 
    /// </summary>
    public sealed partial class App
    {
        /// <summary>
        /// 
        /// </summary>
        [Inject]
        private IJSRuntime JSRuntime { get; set; }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="firstRender"></param>
        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            await base.OnAfterRenderAsync(firstRender);

            if (firstRender && OperatingSystem.IsBrowser())
            {
                await JSRuntime.InvokeVoidAsync("$.loading");
            }
        }
    }
}
