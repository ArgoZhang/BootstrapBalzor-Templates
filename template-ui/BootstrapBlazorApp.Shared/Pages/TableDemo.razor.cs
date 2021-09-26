using BootstrapBlazor.Components;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.Localization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BootstrapBlazorApp.Shared.Pages
{
    /// <summary>
    /// 
    /// </summary>
    public partial class TableDemo : ComponentBase
    {
        [Inject]
        private IStringLocalizer<Foo> Localizer { get; set; }

        private IEnumerable<SelectedItem> Hobbys { get; set; }

        /// <summary>
        /// 
        /// </summary>
        protected override async Task OnInitializedAsync()
        {
            await base.OnInitializedAsync();

            Hobbys = Foo.GenerateHobbys(Localizer);
        }

        /// <summary>
        /// 
        /// </summary>
        private IEnumerable<int> PageItemsSource => new int[] { 4, 10, 20 };
    }
}
