using BootstrapBlazor.Components;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace BootstrapBlazorApp.Shared.Pages
{
    /// <summary>
    /// 
    /// </summary>
    public partial class TableDemo : ComponentBase
    {
        /// <summary>
        /// 
        /// </summary>
        private static readonly Random random = new Random();

        /// <summary>
        /// 
        /// </summary>
        protected override void OnInitialized()
        {
            base.OnInitialized();

            Items = GenerateItems();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="options"></param>
        /// <returns></returns>
        private Task<QueryData<BindItem>> OnQueryAsync(QueryPageOptions options)
        {
            var items = Items;

            var isSearched = false;
            if (options.Searchs.Any())
            {
                // 针对 SearchText 进行模糊查询
                items = items.Where(options.Searchs.GetFilterFunc<BindItem>(FilterLogic.Or)).ToList();
                isSearched = true;
            }

            // 过滤
            var isFiltered = false;
            if (options.Filters.Any())
            {
                items = items.Where(options.Filters.GetFilterFunc<BindItem>()).ToList();

                // 通知内部已经过滤数据了
                isFiltered = true;
            }

            // 排序
            var isSorted = false;
            if (!string.IsNullOrEmpty(options.SortName))
            {
                var invoker = LambdaExtensions.GetSortLambda<BindItem>().Compile();
                items = invoker(items, options.SortName, options.SortOrder).ToList();

                // 通知内部已经过滤数据了
                isSorted = true;
            }

            // 设置记录总数
            var total = items.Count;

            // 内存分页
            items = items.Skip((options.PageIndex - 1) * options.PageItems).Take(options.PageItems).ToList();

            return Task.FromResult(new QueryData<BindItem>()
            {
                Items = items,
                TotalCount = total,
                IsSorted = isSorted,
                IsFiltered = isFiltered,
                IsSearch = isSearched
            });
        }

        private Task<bool> OnDeleteAsync(IEnumerable<BindItem> items)
        {
            Items.RemoveAll(item => items.Contains(item));
            return Task.FromResult(true);
        }

        private Task<bool> OnSaveAsync(BindItem item)
        {
            Items.Add(item);
            return Task.FromResult(true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private static List<BindItem> GenerateItems() => Enumerable.Range(1, 80).Select(i => new BindItem()
        {
            Id = i,
            Name = $"张三 {i:d4}",
            DateTime = DateTime.Now.AddDays(i - 1),
            Address = $"上海市普陀区金沙江路 {random.Next(1000, 2000)} 弄",
            Count = random.Next(1, 100),
            Complete = random.Next(1, 100) > 50
        }).ToList();

        /// <summary>
        /// 
        /// </summary>
        private List<BindItem> Items { get; set; }

        /// <summary>
        /// 
        /// </summary>
        private IEnumerable<int> PageItemsSource => new int[] { 4, 10, 20 };

        /// <summary>
        ///
        /// </summary>
        public class BindItem
        {
            /// <summary>
            ///
            /// </summary>
            [Display(Name = "主键")]
            [AutoGenerateColumn(Ignore = true)]
            public int Id { get; set; }

            /// <summary>
            ///
            /// </summary>
            [Required(ErrorMessage = "{0}不能为空")]
            [AutoGenerateColumn(Order = 10, Sortable = true, Filterable = true, Searchable = true)]
            [Display(Name = "姓名")]
            public string Name { get; set; }

            /// <summary>
            ///
            /// </summary>
            [AutoGenerateColumn(Order = 1, FormatString = "yyyy-MM-dd", Width = 180, Sortable = true, Filterable = true, Searchable = true)]
            [Display(Name = "日期")]
            public DateTime? DateTime { get; set; }

            /// <summary>
            ///
            /// </summary>
            [Display(Name = "地址")]
            [Required(ErrorMessage = "{0}不能为空")]
            [AutoGenerateColumn(Order = 20, Sortable = true, Filterable = true, Searchable = true)]
            public string Address { get; set; }

            /// <summary>
            ///
            /// </summary>
            [Display(Name = "数量")]
            [AutoGenerateColumn(Order = 40, Sortable = true, Filterable = true, Searchable = true)]
            public int Count { get; set; }

            /// <summary>
            ///
            /// </summary>
            [Display(Name = "是/否")]
            [AutoGenerateColumn(Order = 50, Sortable = true, Filterable = true)]
            public bool Complete { get; set; }
        }
    }
}
