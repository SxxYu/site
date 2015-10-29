<script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js">
</script>
<div class="copyright" >
  {% set current = date(Date.now(), "YYYY") %}
  &copy; {% if theme.since and theme.since != current %} {{ theme.since }} - {% endif %}
  <span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="icon-next-heart fa fa-heart"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ config.author }}</span>
</div>

<div class="powered-by">
  {{ __('footer.powered', '<a class="theme-link" href="http://hexo.io" target="_blank">Hexo</a>') }}
</div>

<div class="theme-info">
  {{ __('footer.theme') }} -
  <a class="theme-link" href="https://github.com/iissnan/hexo-theme-next" target="_blank">
    NexT{% if theme.scheme %}.{{ theme.scheme }}{% endif %}
  </a>
</div>

<div class="theme-info">
&nbsp; | &nbsp; 总访问量
<span id="busuanzi_value_site_pv"><i class="fa fa-spinner"></i></span>次
</div>

<div class="theme-info">
&nbsp; | &nbsp; 访客数
<span id="busuanzi_value_site_uv"><i class="fa fa-spinner"></i></span>人
</div>

<div class="theme-info">
&nbsp; |&nbsp; 本文阅读量
<span id="busuanzi_value_page_pv"><i class="fa fa-spinner"></i></span>次
</div>


{% block footer %}{% endblock %}