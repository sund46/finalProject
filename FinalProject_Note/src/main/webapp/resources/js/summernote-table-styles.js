/* https://github.com/tylerecouture/summernote-lists  */

(function(factory) {
  /* global define */
  if (typeof define === "function" && define.amd) {
    // AMD. Register as an anonymous module.
    define(["jquery"], factory);
  } else if (typeof module === "object" && module.exports) {
    // Node/CommonJS
    module.exports = factory(require("jquery"));
  } else {
    // Browser globals
    factory(window.jQuery);
  }
})(function($) {
  $.extend(true, $.summernote.lang, {
    "en-US": {
      tableStyles: {
        tooltip: "배경색"
      }
    }
  });
  $.extend($.summernote.options, {
    tableStyles: {
      
    }
  });

  // Extends plugins for emoji plugin.
  $.extend($.summernote.plugins, {
    tableStyles: function(context) {
      var self = this,
        ui = $.summernote.ui,
        options = context.options,
        lang = options.langInfo;
      ($editor = context.layoutInfo.editor),
        ($editable = context.layoutInfo.editable);
      editable = $editable[0];

      context.memo("button.tableStyles", function() {
        /*var button = ui.buttonGroup([
          ui.button({
            className: "dropdown-toggle",
            contents: ui.dropdownButtonContents(
              ui.icon(options.icons.magic),
              options
            ),
            tooltip: lang.tableStyles.tooltip,
            data: {
              toggle: "dropdown"
            }
          }),
          ui.dropdownCheck({
            className: "dropdown-table-style",
            checkClassName: options.icons.menuCheck,
            items: self.generateListItems(
              options.tableStyles.stylesExclusive,
              lang.tableStyles.stylesExclusive,
              options.tableStyles.stylesInclusive,
              lang.tableStyles.stylesInclusive
            ),
            callback: function($dropdown) {
              $dropdown.find("a").each(function() {
                $(this).click(function() {
                  self.updateTableStyles(this);
                });
              });
            }
          })
        ]);*/
        return self.colorPalette('note-color-all', lang.color.background, true, true);
      });

      
      self.colorPalette = function (className, tooltip, backColor, foreColor) {
          var _this = this;
          return ui.buttonGroup({
              className: 'note-color ' + className,
              children: [
                  ui.button({
                      className: 'note-current-color-button',
                      contents: ui.icon(options.icons.font + ' note-recent-color'),
                      tooltip: tooltip,
                      click: function (e) {
                          var $button = $(e.currentTarget);
                          if (backColor && foreColor) {
                              context.invoke('editor.color', {
                                  backColor: $button.attr('data-backColor'),
                                  foreColor: $button.attr('data-foreColor')
                              });
                          }
                          else if (backColor) {
                              context.invoke('editor.color', {
                                  backColor: $button.attr('data-backColor')
                              });
                          }
                          else if (foreColor) {
                             context.invoke('editor.color', {
                                  foreColor: $button.attr('data-foreColor')
                              });
                          }
                      },
                      callback: function ($button) {
                          var $recentColor = $button.find('.note-recent-color');
                          if (backColor) {
                              $recentColor.css('background-color', options.colorButton.backColor);
                              $button.attr('data-backColor', options.colorButton.backColor);
                          }
                          if (foreColor) {
                              $recentColor.css('color', options.colorButton.foreColor);
                              $button.attr('data-foreColor', options.colorButton.foreColor);
                          }
                          else {
                              $recentColor.css('color', 'transparent');
                          }
                      }
                  }),
                  ui.button({
                      className: 'dropdown-toggle',
                      contents: ui.dropdownButtonContents('', options),
                      tooltip: lang.color.more,
                      data: {
                          toggle: 'dropdown'
                      }
                  }),
                  ui.dropdown({
                      items: (backColor ? [
                          '<div class="note-palette">',
                          '  <div class="note-palette-title">' + lang.color.background + '</div>',
                          '  <div>',
                          '    <button type="button" class="note-color-reset btn btn-light" data-event="backColor" data-value="inherit">',
                          lang.color.transparent,
                          '    </button>',
                          '  </div>',
                          '  <div class="note-holder" data-event="backColor"/>',
                          '  <div>',
                          '    <button type="button" class="note-color-select btn" data-event="openPalette" data-value="backColorPicker">',
                          lang.color.cpSelect,
                          '    </button>',
                          '    <input type="color" id="backColorPicker" class="note-btn note-color-select-btn" value="' + options.colorButton.backColor + '" data-event="backColorPalette">',
                          '  </div>',
                          '  <div class="note-holder-custom" id="backColorPalette" data-event="backColor"/>',
                          '</div>',
                      ].join('') : '') +
                          (foreColor ? [
                              '<div class="note-palette">',
                              '  <div class="note-palette-title">' + lang.color.foreground + '</div>',
                              '  <div>',
                              '    <button type="button" class="note-color-reset btn btn-light" data-event="removeFormat" data-value="foreColor">',
                              lang.color.resetToDefault,
                              '    </button>',
                              '  </div>',
                              '  <div class="note-holder" data-event="foreColor"/>',
                              '  <div>',
                              '    <button type="button" class="note-color-select btn" data-event="openPalette" data-value="foreColorPicker">',
                              lang.color.cpSelect,
                              '    </button>',
                              '    <input type="color" id="foreColorPicker" class="note-btn note-color-select-btn" value="' + options.colorButton.foreColor + '" data-event="foreColorPalette">',
                              '  <div class="note-holder-custom" id="foreColorPalette" data-event="foreColor"/>',
                              '</div>',
                          ].join('') : ''),
                      callback: function ($dropdown) {
                          $dropdown.find('.note-holder').each(function (idx, item) {
                              var $holder = $(item);
                              $holder.append(ui.palette({
                                  colors: options.colors,
                                  colorsName: options.colorsName,
                                  eventName: $holder.data('event'),
                                  container: options.container,
                                  tooltip: options.tooltip
                              }).render());
                          });
                          /* TODO: do we have to record recent custom colors within cookies? */
                          var customColors = [
                              ['#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF', '#FFFFFF'],
                          ];
                          $dropdown.find('.note-holder-custom').each(function (idx, item) {
                              var $holder = $(item);
                              $holder.append(ui.palette({
                                  colors: customColors,
                                  colorsName: customColors,
                                  eventName: $holder.data('event'),
                                  container: options.container,
                                  tooltip: options.tooltip
                              }).render());
                          });
                          $dropdown.find('input[type=color]').each(function (idx, item) {
                              $(item).change(function () {
                                  var $chip = $dropdown.find('#' + $(this).data('event')).find('.note-color-btn').first();
                                  var color = this.value.toUpperCase();
                                  $chip.css('background-color', color)
                                      .attr('aria-label', color)
                                      .attr('data-value', color)
                                      .attr('data-original-title', color);
                                  $chip.click();
                              });
                          });
                      },
                      click: function (event) {
                          event.stopPropagation();
                          var $parent = $('.' + className);
                          var $button = $(event.target);
                          var eventName = $button.data('event');
                          var value = $button.attr('data-value');
                          if (eventName === 'openPalette') {
                              var $picker = $parent.find('#' + value);
                              var $palette = $($parent.find('#' + $picker.data('event')).find('.note-color-row')[0]);
                              // Shift palette chips
                              var $chip = $palette.find('.note-color-btn').last().detach();
                              // Set chip attributes
                              var color = $picker.val();
                              $chip.css('background-color', color)
                                  .attr('aria-label', color)
                                  .attr('data-value', color)
                                  .attr('data-original-title', color);
                              $palette.prepend($chip);
                              $picker.click();
                          }
                          else if (lists.contains(['backColor', 'foreColor'], eventName)) {
                              var key = eventName === 'backColor' ? 'background-color' : 'color';
                              var $color = $button.closest('.note-color').find('.note-recent-color');
                              var $currentButton = $button.closest('.note-color').find('.note-current-color-button');
                              $color.css(key, value);
                              $currentButton.attr('data-' + eventName, value);
                              context.invoke('editor.' + eventName, value);
                          }
                      }
                  }),
              ]
          }).render();
      };
    }
  });
});
