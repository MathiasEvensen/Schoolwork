import discord
import random
import giphy_client
import speedtest
from giphy_client.rest import ApiException
from discord.ext import commands

logging.basicConfig(format='%(asctime)s - %(message)s', level=logging.INFO)

disctoken = 'YOUR_TOKEN_HERE'

giphy_token = 'YOUR_GIPHY_TOKEN_HERE'
bot = commands.Bot(command_prefix='!')

api_instance = giphy_client.DefaultApi()
config = {'api_key': 'YOUR_GIPHY_TOKEN_HERE', 'q': '', 'limit': 1, 'rating': 'PG-13'}

try:
    api_response = api_instance.gifs_search_get(config['api_key'], limit=config['limit'], rating=config['rating'], q=config['q'])
except ApiException as e:
    print("Exception when calling DefaultApi->gifs_search_get: %s\n" % e)
    logging.error("Exception when calling DefaultApi->gifs_search_get: %s\n" % e)


@bot.event
async def on_ready():
    logging.info('------')
    logging.info('Logged in as')
    logging.info(bot.user.name)
    logging.info(bot.user.id)
    logging.info('------')
    await bot.change_presence(status=discord.Status.online, activity=discord.Game("!help"))


@bot.command()
async def hello(ctx, i=[0]):
    i[0]+=1
    await ctx.send(":poop: :wave: Hello, there!")
    return i[0]


@bot.command()
async def ping(ctx, i=[0]):
    i[0]+=1
    await ctx.send(f'{round(bot.latency * 1000)} ms')
    return i[0]


@bot.command()
async def roll(ctx,*args, i=[0]):
    i[0]+=1
    try:
        if len(args) == 0:
            rn1 = random.randint(0, 100)
            await ctx.send("roll: " + "**"+str(0)+"**" + " <--> " + "**"+str(100)+"**" + "  =  " + "**"+str(rn1)+"**")
        elif len(args) == 1:
            var1 = int(args[0])
            rn2 = random.randint(0, var1)
            await ctx.send("roll: " + "**"+str(0)+"**" + " <--> " + "**"+str(var1)+"**" + "  =  " + "**"+str(rn2)+"**")
        elif len(args) == 2:
            var1 = int(args[0])
            var2 = int(args[1])
            var1, var2 = [x for x in [var1, var2]]
            rn3 = random.randint(var1, var2)
            await ctx.send("roll: " + "**"+str(var1)+"**" + " <--> " + "**"+str(var2)+"**" + "  =  " + "**"+str(rn3)+"**")
        else:
            await ctx.send("You cannot roll between more than two numbers :poop:")
    except ValueError:
        await ctx.send("You cannot roll in a negative range :poop:")

    return i[0]


@bot.command()
async def st(ctx, i=[0]):
    i[0]+=1
    s = speedtest.Speedtest()
    s.get_servers()
    s.get_best_server()
    s.download()
    s.upload()
    res = s.results.dict()

    await ctx.send("Speedtest of Poopy's server: \n Download: {:.2f} Mbps/s\n".format(res["download"] / 1024 / 1024) +
        '\n Upload: {:.2f} Mbps/s\n'.format(res["upload"] / 1024 / 1024) + '\n Ping: {}\n'.format(res["ping"]))

    return i[0]


@bot.command()
async def info(ctx, i=[0]):
    i[0]+=1
    embed = discord.Embed(title="Poopy", description="Produces poop when words of :poop: are said", color=0xeee657)

    # give info about you here
    embed.add_field(name="Creator", value="iMatMan")

    # Shows the number of servers the bot is member of.
    embed.add_field(name="Server count", value=f"{len(bot.guilds)}")

    # give users a link to invite thsi bot to their server
    embed.add_field(name="Invite", value="[Invite link](https://discordapp.com/api/oauth2/authorize?client_id=680945826742141021&permissions=1275591744&scope=bot)")

    await ctx.send(embed=embed)

    return i[0]


async def search_gifs(query):
    try:
        response = api_instance.gifs_search_get(giphy_token, query, limit=5, rating='PG-13')
        lst = list(response.data)
        gif = random.choices(lst)

        return gif[0].url

    except ApiException as e:
        return "Exception when calling DefaultApi->gifs_search_get: %s\n" % e


@bot.command()
async def gif(ctx, typed, i=[0]):
    i[0]+=1
    gif = await search_gifs(typed)
    await ctx.send(gif)

    return i[0]


bot.remove_command('help')


@bot.command()
async def help(ctx, i=[0]):
    i[0]+=1
    embed = discord.Embed(title="Poopy", description=":poop: List of commands are:", color=0xeee657)

    embed.set_image(url="https://static.turbosquid.com/Preview/2016/12/23__10_48_29/poop_portrat_noplatform.png804D254F-52A5-45E9-BA0E-931280A02211Zoom.jpg")

    embed.add_field(name="!gif 'some text here'", value="Gives you a gif of what you have typed", inline=False)
    embed.add_field(name="!roll", value="Examples are: ***!roll*** --> 0-100, ***!roll 58*** --> 0-58, ***!roll 5 60*** --> 5-60", inline=False)
    embed.add_field(name="!ping", value="Gives you latency in ms", inline=False)
    embed.add_field(name="!hello", value="Gives a nice greet message", inline=False)
    embed.add_field(name="!info", value="Gives a little info about the bot", inline=False)
    embed.add_field(name="!help", value="Gives this message", inline=False)

    await ctx.send(embed=embed)

    return i[0]


keyword = ['bash', 'bæsj', 'drit', 'shit', 'poop']
@bot.event
async def on_message(message, i=[0]):
    i[0]+=1
    if message.author == bot.user:
        return
    if message.author.bot: return

    message_text = message.content.strip().lower()
    for i in keyword:
        if i in message_text:
            await message.channel.send(':poop:')

    await bot.process_commands(message)

    return i[0]


bot.run(disctoken)