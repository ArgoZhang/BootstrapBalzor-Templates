using BootstrapBlazor.Components;
using System.Collections.Generic;

namespace BootstrapBlazorApp.WebAssembly.Shared
{
    /// <summary>
    /// 
    /// </summary>
    public sealed partial class MainLayout
    {
        private bool UseTabSet { get; set; }

        private List<MenuItem> Menus { get; set; }

        /// <summary>
        /// OnInitialized 方法
        /// </summary>
        protected override void OnInitialized()
        {
            base.OnInitialized();

            // TODO: 菜单获取可以通过数据库获取，此处为示例直接拼装的菜单集合
            Menus = GetIconSideMenuItems();
        }

        private List<MenuItem> GetIconSideMenuItems() => new List<MenuItem>
        {
            new MenuItem() { Text = "返回组件库", Icon = "fa fa-fw fa-home", Url = "https://www.blazor.zone/components" },
            new MenuItem() { Text = "Index", Icon = "fa fa-fw fa-fa", Url = "" },
            new MenuItem() { Text = "Counter", Icon = "fa fa-fw fa-check-square-o", Url = "counter" },
            new MenuItem() { Text = "FetchData", Icon = "fa fa-fw fa-database", Url = "fetchdata" }
        };
    }
}
