import discord
import random
import giphy_client
import speedtest
from giphy_client.rest import ApiException
from discord.ext import commands

disctoken = 'Enter your token here'

giphy_token = 'Enter Your Giphy token here'
bot = commands.Bot(command_prefix='!')

api_instance = giphy_client.DefaultApi()
config = {'api_key': 'Enter Your Giphy token here', 'q': '', 'limit': 1, 'rating': 'PG-13'}

try:
    api_response = api_instance.gifs_search_get(config['api_key'], limit=config['limit'], rating=config['rating'], q=config['q'])

except ApiException as e:
    print("Exception when calling DefaultApi->gifs_search_get: %s\n" % e)


@bot.event
async def on_ready():
    print('------')
    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    await bot.change_presence(status=discord.Status.online, activity=discord.Game("!help"))
    print('------')

@bot.command()
async def hello(ctx):
    await ctx.send(":poop: :wave: Hello, there!")

@bot.command()
async def ping(ctx):
    await ctx.send(f'{round(bot.latency * 1000)} ms')


@bot.command()
async def st(ctx):
    s = speedtest.Speedtest()
    s.get_servers()
    s.get_best_server()
    s.download()
    s.upload()
    res = s.results.dict()

    await ctx.send("Speedtest of Poopy's server: \n Download: {:.2f} Mb/s\n".format(res["download"] / 1024 / 1024) +
        '\n Upload: {:.2f} Mb/s\n'.format(res["upload"] / 1024 / 1024) + '\n Ping: {}\n'.format(res["ping"]))

@bot.command()
async def info(ctx):
    embed = discord.Embed(title="Poopy", description="Produces poop :poop:", color=0xeee657)

    # give info about you here
    embed.add_field(name="Creator", value="YOUR NAME")

    # Shows the number of servers the bot is member of.
    embed.add_field(name="Server count", value=f"{len(bot.guilds)}")

    # give users a link to invite thsi bot to their server
    embed.add_field(name="Invite", value="[Invite link](Enter your bots OAUTH link here)")

    await ctx.send(embed=embed)

async def search_gifs(query):
    try:
        response = api_instance.gifs_search_get(giphy_token, query, limit=5, rating='PG-13')
        lst = list(response.data)
        gif = random.choices(lst)

        return gif[0].url

    except ApiException as e:
        return "Exception when calling DefaultApi->gifs_search_get: %s\n" % e

@bot.command()
async def gif(ctx, typed):
    gif = await search_gifs(typed)
    await ctx.send(gif)

bot.remove_command('help')

@bot.command()
async def help(ctx):
    embed = discord.Embed(title="Poopy", description=":poop: List of commands are:", color=0xeee657)

    embed.set_image(url="https://static.turbosquid.com/Preview/2016/12/23__10_48_29/poop_portrat_noplatform.png804D254F-52A5-45E9-BA0E-931280A02211Zoom.jpg")

    embed.add_field(name="!gif 'some text here'", value="Gives you a gif with of what you have typed", inline=False)
    embed.add_field(name="!ping", value="Gives you latency in ms", inline=False)
    embed.add_field(name="!hello", value="Gives a nice greet message", inline=False)
    embed.add_field(name="!info", value="Gives a little info about the bot", inline=False)
    embed.add_field(name="!help", value="Gives this message", inline=False)

    await ctx.send(embed=embed)

keyword = ['bash', 'bæsj', 'drit', 'shit']
@bot.event
async def on_message(message):

    message_text = message.content.strip().lower()
    for i in keyword:
        if i in message_text:
            await message.channel.send(':poop:')


    await bot.process_commands(message)

bot.run(disctoken)

