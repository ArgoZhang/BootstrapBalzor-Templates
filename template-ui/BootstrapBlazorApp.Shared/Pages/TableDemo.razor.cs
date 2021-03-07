using BootstrapBlazor.Components;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.Localization;
using System;
using System.Collections.Generic;
using System.Linq;
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
        protected override void OnInitialized()
        {
            base.OnInitialized();

            Items = Foo.GenerateFoo(Localizer);
            Hobbys = Foo.GenerateHobbys(Localizer);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="options"></param>
        /// <returns></returns>
        private Task<QueryData<Foo>> OnQueryAsync(QueryPageOptions options)
        {
            var items = Items;

            var isSearched = false;
            if (options.Searchs.Any())
            {
                // 针对 SearchText 进行模糊查询
                items = items.Where(options.Searchs.GetFilterFunc<Foo>(FilterLogic.Or)).ToList();
                isSearched = true;
            }

            // 过滤
            var isFiltered = false;
            if (options.Filters.Any())
            {
                items = items.Where(options.Filters.GetFilterFunc<Foo>()).ToList();

                // 通知内部已经过滤数据了
                isFiltered = true;
            }

            // 排序
            var isSorted = false;
            if (!string.IsNullOrEmpty(options.SortName))
            {
                var invoker = LambdaExtensions.GetSortLambda<Foo>().Compile();
                items = invoker(items, options.SortName, options.SortOrder).ToList();

                // 通知内部已经过滤数据了
                isSorted = true;
            }

            // 设置记录总数
            var total = items.Count;

            // 内存分页
            items = items.Skip((options.PageIndex - 1) * options.PageItems).Take(options.PageItems).ToList();

            return Task.FromResult(new QueryData<Foo>()
            {
                Items = items,
                TotalCount = total,
                IsSorted = isSorted,
                IsFiltered = isFiltered,
                IsSearch = isSearched
            });
        }

        private Task<bool> OnDeleteAsync(IEnumerable<Foo> items)
        {
            Items.RemoveAll(item => items.Contains(item));
            return Task.FromResult(true);
        }

        private Task<bool> OnSaveAsync(Foo item)
        {
            Items.Add(item);
            return Task.FromResult(true);
        }

        /// <summary>
        /// 
        /// </summary>
        private List<Foo> Items { get; set; }

        /// <summary>
        /// 
        /// </summary>
        private static IEnumerable<int> PageItemsSource => new int[] { 4, 10, 20 };
    }
}
