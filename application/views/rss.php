<rss version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">
 
    <channel>
     
    <title><?php echo $feed_name; ?></title>
 
    <link><?php echo $feed_url; ?></link>
    <description><?php echo $page_description; ?></description>
    <dc:language><?php echo $page_language; ?></dc:language>
    <dc:creator><?php echo $creator_email; ?></dc:creator>
 
    <dc:rights>Copyright <?php echo gmdate("Y", time()); ?></dc:rights>
    <admin:generatorAgent rdf:resource="http://www.codeigniter.com/" />
    <?php foreach ($archive_info as $key => $value) { ?>
        <item>
          <title><?php echo xml_convert($value['journal_name']); ?></title>
          <link><?php echo site_url('blog/posting/' . $value['id']) ?></link>
          <guid><?php echo site_url('blog/posting/' . $value['id']) ?></guid>

            <description><![CDATA[ <?php echo character_limiter($value['archive_desc'], 2000); ?> ]]></description>
            <pubDate><?php echo $value['created_date']; ?></pubDate>
        </item>
    <?php } ?>
    
     
    </channel>
</rss>